#!/bin/sh

#  Iconizer.sh
#  https://github.com/dzenbot/Iconic
#
#  Created by Ignacio Romero on 5/28/16.
#  Copyright © 2016 DZN Labs All rights reserved.
#

# Source file paths
EXEC_PATH=./Vendor/SwiftGen/build/swiftgen/bin/swiftgen
STENCIL_PATH=./Source/iconic-default.stencil
HTML_PATH=./Source/catalog.html
HTML_DIR=./Source/html

# Font file path
INPUT_PATH=$1
OUTPUT_PATH=$2

# If the output param is missing, use the same directory than the input's
if [ -z ${OUTPUT_PATH} ] ; then
    OUTPUT_PATH=$(dirname ${INPUT_PATH})
fi



function generate()
{
    FILE_PATH=$1

    # Input's file name and extension
    FILE_NAME=$(basename "${FILE_PATH}")
    FILE_EXTENSION="${FILE_NAME##*.}"
    FILE_TITLE="${FILE_NAME%.*}"

    ICON_NAME="${FILE_TITLE%%"-"*}Icon"

    # Capitalized first word of the file name, with the 'Icons' suffix.
    # ie: SlackIcons out of a string like 'slack-icon-font'
    OUTPUT_NAME=$(tr '[:lower:]' '[:upper:]' <<< ${ICON_NAME:0:1})${ICON_NAME:1}

	# Copies the original font to Library/Fonts if not already
	# The font file needs to be available before executing the SwiftGen template.
    FONT_PATH=/Library/Fonts/${FILE_NAME}

	if [ ! -f ${FONT_PATH} ]; then
    	cp -r ${FILE_PATH} ${FONT_PATH}
	fi
	
	# Creates the output folder
	mkdir -p ${OUTPUT_PATH}/
	
	# Executes Swiftgen with a custom stencil template
	${EXEC_PATH} icons ${FONT_PATH} --templatePath ${STENCIL_PATH} --output ${OUTPUT_PATH}/${OUTPUT_NAME}.swift --enumName ${OUTPUT_NAME}

    # Renames and moves the JSON output to the HTML source directory
    cp -r ${OUTPUT_PATH}/${OUTPUT_NAME}.json ${CATALOG_DIR}/data.json

	# Copies the HTML template over
	cp -r ${CATALOG_DIR}/* ${OUTPUT_PATH}/
	
	# Copies the original font to src/
	cp -r ${FONT_PATH} ${OUTPUT_PATH}/${FILE_NAME}
	cp -r ${FONT_PATH} ${CATALOG_DIR}/${FILE_NAME}
}



##Only TTF and OTF are supported font files
if [ -z ${INPUT_PATH} ]; then
	echo "Missing font file. Please provide a TTF or OTF file path."
else
    # Input's file name and extension
    INPUT_NAME=$(basename "${INPUT_PATH}")
    INPUT_EXTENSION="${INPUT_NAME##*.}"

    if [ ${INPUT_EXTENSION} = 'ttf' ] || [ ${INPUT_EXTENSION} = 'otf' ]; then

        generate ${INPUT_PATH}
    else
        echo "Unsupported font file. Please provide a TTF or OTF file path."
    fi
fi
