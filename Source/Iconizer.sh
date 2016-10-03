#!/bin/sh

#  Iconizer.sh
#  https://github.com/dzenbot/Iconic
#
#  Created by Ignacio Romero on 5/28/16.
#  Copyright © 2016 DZN Labs All rights reserved.
#
# Script in charge of executing SwitfGen, passing the icon font file path, the enum name and the custom stencil as arguments.
#


# Font file path
INPUT_PATH=$1

# Source file paths
EXEC_PATH=Vendor/SwiftGen/build/swiftgen/bin/swiftgen
STENCIL_PATH=Source/iconic-default.stencil
CATALOG_PATH=Source/Catalog
OUTPUT_PATH=Source/


function getFileTitle()
{
    # Input variables
    filename=$1

    # Removes the file extension
    name="${filename%.*}"
    
    # Splits and removes all substrings with the separator characters in the file name
    # like whitespaces, dash, underscore, etc.
    title="${name%%[" -_–"]*}"
    
    # Specially, we want to strip the string starting from the word "Icon", and append it manually,
    # so a string like 'MaterialIconsFont' would look like 'MaterialIcon'.
    title="${title%%"icon"*}"
    title="${title%%"Icon"*}Icon"
    
    # Upper case the first character
    title="$(tr '[:lower:]' '[:upper:]' <<< ${title:0:1})${title:1}"

    echo "${title}"
}

function iconize()
{
    # Input variables
    FONT_PATH=$1
    FONT_NAME=$2
    
    echo "Iconizer: Starting with file path ${FONT_PATH}"

    # Capitalized first word of the file name, with the 'Icon' suffix.
    # ie: FontAwesomeIcon out of a string like 'FontAwesome'
    OUTPUT_NAME=$( getFileTitle "${FONT_NAME}" )

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
	echo "Iconizer: Missing font file at path ${INPUT_PATH}. Please provide a TTF or OTF file path."
else
    echo "Iconizer: Initializing with path ${INPUT_PATH}"

    # Input's file name and extension
    INPUT_NAME=$(basename "${INPUT_PATH}")
    echo "Iconizer: INPUT_NAME = ${INPUT_NAME}"
    
    INPUT_EXTENSION="${INPUT_NAME##*.}"
    echo "Iconizer: INPUT_EXTENSION = ${INPUT_EXTENSION}"

    if [ ${INPUT_EXTENSION} = 'ttf' ] || [ ${INPUT_EXTENSION} = 'otf' ]; then

        iconize ${INPUT_PATH} ${INPUT_NAME}
    else
        echo "Iconizer: Unsupported ${INPUT_EXTENSION} file. Please provide a TTF or OTF file path."
    fi
fi
