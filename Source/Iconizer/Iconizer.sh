#!/bin/sh

#  Iconizer.sh
#  https://github.com/dzenbot/Iconic
#
#  Created by Ignacio Romero on 5/28/16.
#  Copyright © 2016 DZN Labs All rights reserved.
#

function usage()
{
    echo "[Usage] $(basename "$0") [FILE_PATH | FILE_RIR] OUTPUT_DIR"
    exit -1
}

# File/Directory paths
EXEC_PATH=./Vendor/SwiftGen/build/swiftgen/bin/swiftgen
STENCIL_PATH=./Source/Iconizer/iconic-default.stencil
HTML_DIR=./Source/Iconizer/catalog

function generate()
{
    FILE_FULL=$1
    FILE=$(basename "${FILE_FULL}")
    FILE_TITLE="${FILE%.*}"
    ICON_NAME="${FILE_TITLE%%"-"*}Icon"

    # When the out param is missing, reuse the same directory than the input's
    if [ -z ${OUTPUT_DIR} ] ; then
        OUTPUT_DIR=$(dirname ${FILE})
    fi

    #Declares the output path
    SOURCE_DIR=${OUTPUT_DIR}
    CATALOG_DIR=${SOURCE_DIR}catalog/${FILE_TITLE}

    # Capitalized first word of the file name, with the 'Icons' suffix.
    # ie: SlackIcons out of a string like 'slack-icon-font'
    OUTPUT_NAME=$(tr '[:lower:]' '[:upper:]' <<< ${ICON_NAME:0:1})${ICON_NAME:1}

    #echo "FILW_FULL=${FILE_FULL}; FILE=${FILE}; FILE_TITLE=${FILE_TITLE}; ICON_NAME=${ICON_NAME}; CATALOG_DIR=${CATALOG_DIR};SOURCE_DIR=${SOURCE_DIR};OUTPUT_NAME=${OUTPUT_NAME}"

    FONT_PATH=/Library/Fonts/${FILE}

    # Copies the original font to Library/Fonts if not already
    # The font file needs to be available before executing the SwiftGen template.
    if [ ! -f ${FILE_FULL} ]; then
        cp -r ${FILE_FULL} ${FONT_PATH}
    fi

    # Creates the output folder
    mkdir -p ${SOURCE_DIR}
    mkdir -p ${CATALOG_DIR}/html

    # Executes Swiftgen with a custom stencil template
    ${EXEC_PATH} icons ${FILE_FULL} --templatePath ${STENCIL_PATH} --output ${SOURCE_DIR}${OUTPUT_NAME}.swift --enumName ${OUTPUT_NAME}

    # Renames and moves the JSON output to the HTML source directory
    mv ${SOURCE_DIR}${OUTPUT_NAME}.json ${CATALOG_DIR}/html/data.json

    # Copies the HTML template over
    #cp -r ${HTML_DIR}/* ${OUTPUT_PATH}
    cp -r ${HTML_DIR}/* ${CATALOG_DIR}

    # Copies the original font to src/
    cp -r ${FILE_FULL} ${SOURCE_DIR}
    cp -r ${FILE_FULL} ${CATALOG_DIR}/html/
}

if [ $# -lt 2 ]; then
    usage
fi

# Font file path
FILE_PATH=$1
OUTPUT_DIR=$2



##Only TTF and OTF supported font files
if [ -z ${FILE_PATH} ]; then
	echo "Missing file to parse. Please provide the path of a font file on disk (TTF or OTF)."

elif [ -d ${FILE_PATH} ]; then
    echo "scaning directory for font files..."

    find ${FILE_PATH} -type f -name '*.ttf' -o -name "*.otf" | while read F; do
        echo "${F}"
        generate ${F}
    done

else
    # Input's file name and extension
    FILE_NAME=$(basename "${FILE_PATH}")
    FILE_EXTENSION="${FILE_NAME##*.}"

    if [ ${FILE_EXTENSION} = 'ttf' ] || [ ${FILE_EXTENSION} = 'otf' ]; then

        generate ${FILE_PATH}
    else
        echo "Please provide a TTF or OTF file."
    fi
fi
