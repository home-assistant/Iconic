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
HTML_DIR=./Source/html/

# Font file path
FILE_PATH=$1

# Input's file name and extension
FILE_NAME=$(basename "${FILE_PATH}")
FILE_EXTENSION="${FILE_NAME##*.}"
FILE_TITLE="${FILE_NAME%.*}"

ICON_NAME="${FILE_TITLE%%"-"*}Icon"

# Capitalized first word of the file name, with the 'Icons' suffix.
# ie: SlackIcons out of a string like 'slack-icon-font'
OUTPUT_NAME=$(tr '[:lower:]' '[:upper:]' <<< ${ICON_NAME:0:1})${ICON_NAME:1}

##Only TTF and OTF supported font files
if [ -z ${FILE_PATH} ]; then
	echo "Missing file to parse. Please provide the path of a font file on disk (TTF or OTF)."

elif [ ${FILE_EXTENSION} = 'ttf' ] || [ ${FILE_EXTENSION} = 'otf' ]; then

	OUTPUT_DIR=$2

	# When the out param is missing, reuse the same directory than the input's
	if [ -z ${OUTPUT_DIR} ] ; then
		OUTPUT_DIR=$(dirname ${FILE_PATH})
	fi


	FONT_PATH=/Library/Fonts/${FILE_NAME}

	# Copies the original font to Library/Fonts if not already
	# The font file needs to be available before executing the SwiftGen template.
	if [ ! -f ${FONT_PATH} ]; then
    	cp -r ${FILE_PATH} ${FONT_PATH}
	fi

	# Declares the output path
	OUTPUT_PATH=${OUTPUT_DIR}
	
	# Creates the output folder
	mkdir -p ${OUTPUT_PATH}
	
	# Executes Swiftgen with a custom stencil template
	${EXEC_PATH} icons ${FONT_PATH} --templatePath ${STENCIL_PATH} --output ${OUTPUT_PATH}${OUTPUT_NAME}.swift --enumName ${OUTPUT_NAME}

    # Renames and moves the JSON output to the HTML source directory
    cp -r ${OUTPUT_PATH}${OUTPUT_NAME}.json ${HTML_DIR}/data.json

	# Copies the HTML template over
	cp -r ${HTML_DIR}/* ${OUTPUT_PATH}
	
	# Copies the original font to src/
	cp -r ${FONT_PATH} ${OUTPUT_PATH}${FILE_NAME}
	cp -r ${FONT_PATH} ${HTML_DIR}/${FILE_NAME}
	
else
	echo "Please provide a TTF or OTF file."
fi
