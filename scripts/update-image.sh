#!/bin/bash



sed -i 's;        image: '$1'/'$2':\(.*\);        image: '$1'/'$2':'$3';g' $4