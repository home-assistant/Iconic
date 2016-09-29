#!/bin/sh

#  Iconizer.sh
#  https://github.com/dzenbot/Iconic
#
#  Created by Ignacio Romero on 5/28/16.
#  Copyright © 2016 DZN Labs All rights reserved.
#

INPUT_PATH=$1

if [ $2 ]; then ROOT_PATH=$2; else ROOT_PATH='.'; fi

cd ${ROOT_PATH}/Vendor/SwiftGen/ && rake install
cd ../..
sh Source/Iconizer.sh ${INPUT_PATH}
