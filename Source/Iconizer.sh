#!/bin/sh

#  Iconizer.sh
#  https://github.com/dzenbot/Iconic
#
#  Created by Ignacio Romero on 5/28/16.
#  Copyright © 2016 DZN Labs All rights reserved.
#
# Script in charge of executing SwitfGen, passing the icon font file path, the enum name and the custom stencil as arguments.
#

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

    # Capitalized first word of the file name, with the 'Icon' suffix.
    # ie: FontAwesomeIcon out of a string like 'FontAwesome'
    OUTPUT_NAME=$( getFileTitle "${FONT_NAME}" )
    echo "Iconizer: Generating API name '${OUTPUT_NAME}'"

	# Creates the output folder (no error if existing)
	mkdir -p ${OUTPUT_PATH}/

	# Executes Swiftgen with a custom stencil template
	${EXEC_PATH} icons ${FONT_PATH} --templatePath ${STENCIL_PATH} --output ${OUTPUT_PATH}/${OUTPUT_NAME}.swift --enumName ${OUTPUT_NAME}

    # Moves and renames the JSON output to the HTML directory
    mv ${OUTPUT_PATH}/${OUTPUT_NAME}.json ${CATALOG_PATH}/data.json
    echo "Iconizer: Moving catalog's json to '${CATALOG_PATH}/data.json'"
    
	# Copies the font file to the HTML directory
	cp -r ${FONT_PATH} ${CATALOG_PATH}/${FONT_NAME}
    echo "Iconizer: Moving catalog's font to '${CATALOG_PATH}/${FONT_NAME}'"
}

function prepare()
{
    # Input variables
    FONT_PATH=$1

    echo "Iconizer: Initializing with path ${FONT_PATH}"

    # Input's file name and extension
    FONT_NAME=$(basename "${FONT_PATH}")
    INPUT_EXTENSION="${FONT_NAME##*.}"
    echo "Iconizer: Processing file '${FONT_NAME}' with extension '${INPUT_EXTENSION}'"

    if [ ${INPUT_EXTENSION} = 'ttf' ] || [ ${INPUT_EXTENSION} = 'otf' ]; then
        iconize ${FONT_PATH} ${FONT_NAME}
    else
        echo "Iconizer: Unsupported ${INPUT_EXTENSION} file. Please provide a TTF or OTF file path."
    fi
}

# If the font path is not specified, FontAwesome is used as the default font.
if [ -z $1 ]; then

    echo "Iconizer: No custom font path provided. Using FontAwesome as default font..."

    prepare "Fonts/FontAwesome-4.6.3/FontAwesome.otf"
else
    prepare $1
fi
