#!/bin/sh

#  Iconizer.sh
#  https://github.com/dzenbot/Iconic
#
#  Created by Ignacio Romero on 5/28/16.
#  Copyright © 2016 DZN Labs All rights reserved.
#

#
# Disclaimer:
# bla bla
#

# Font file path
INPUT_PATH=$1
OUTPUT_PATH=$2
ROOT_PATH=$3

cd ${ROOT_PATH}/Vendor/SwiftGen/ && rake install xcode-select -switch ~/Applications/Xcode.app/
cd ${ROOT_PATH}
sh ${ROOT_PATH}/Source/Iconizer.sh ${INPUT_PATH} ${OUTPUT_PATH} ${ROOT_PATH} --verbose