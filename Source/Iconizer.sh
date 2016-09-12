#!/bin/sh

#  Iconizer.sh
#  https://github.com/dzenbot/Iconic
#
#  Created by Ignacio Romero on 5/28/16.
#  Copyright © 2016 DZN Labs All rights reserved.
#

# Font file path
INPUT_PATH=$1
OUTPUT_PATH=$2
ROOT_PATH=$3

# Source file paths
EXEC_PATH=${ROOT_PATH}/Vendor/SwiftGen/build/swiftgen/bin/swiftgen
STENCIL_PATH=${ROOT_PATH}/Source/iconic-default.stencil
CATALOG_PATH=${ROOT_PATH}/Source/Catalog

# If the output param is missing, use the same directory than the input's
if [ -z ${OUTPUT_PATH} ] ; then
    OUTPUT_PATH=$(dirname ${INPUT_PATH})
fi



function iconize()
{
    FONT_PATH=$1
    FONT_NAME=$2

    echo "Iconizer: Starting with file path ${FONT_PATH}"

    # Input's file name and extension
    FILE_TITLE="${FONT_NAME%.*}"
    FILE_NAME="${FILE_TITLE%%"-"*}Icon"

    # Capitalized first word of the file name, with the 'Icons' suffix.
    # ie: SlackIcons out of a string like 'slack-icon-font'
    OUTPUT_NAME=$(tr '[:lower:]' '[:upper:]' <<< ${FILE_NAME:0:1})${FILE_NAME:1}

	# Creates the output folder (no error if existing)
	mkdir -p ${OUTPUT_PATH}/
	
	# Executes Swiftgen with a custom stencil template
	${EXEC_PATH} icons ${FONT_PATH} --templatePath ${STENCIL_PATH} --output ${OUTPUT_PATH}/${OUTPUT_NAME}.swift --enumName ${OUTPUT_NAME}

    # Moves and renames the JSON output to the HTML directory
    mv ${OUTPUT_PATH}/${OUTPUT_NAME}.json ${CATALOG_PATH}/data.json

	# Copies the font file to the HTML directory
	cp -r ${FONT_PATH} ${CATALOG_PATH}/${FONT_NAME}
}



# Only TTF and OTF are supported font files
if [ -z ${INPUT_PATH} ]; then
	echo "Missing font file. Please provide a TTF or OTF file path."
else
    # Input's file name and extension
    INPUT_NAME=$(basename "${INPUT_PATH}")
    INPUT_EXTENSION="${INPUT_NAME##*.}"

    echo "Iconizer: Initializing"

    if [ ${INPUT_EXTENSION} = 'ttf' ] || [ ${INPUT_EXTENSION} = 'otf' ]; then

        iconize ${INPUT_PATH} ${INPUT_NAME}
    else
        echo "Iconizer: Unsupported ${INPUT_EXTENSION} file. Please provide a TTF or OTF file path."
    fi
fi
