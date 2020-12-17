#!/bin/bash

#XMLEditor for now
unzip ZIP/XMLEditor.zip

# create component directories
for i in `grep "^XMLEditor," proj_moduleID_classID_className.csv | awk -F"," '{print $2}' | uniq`; do for j in `grep "^XMLEditor,$i," proj_moduleID_classID_className.csv | awk -F"," '{print $5}'| sed 's/^\///'| xargs dirname`; do mkdir -p component-$i/$j; done; done

# copy project files into components
for i in `grep "^XMLEditor," proj_moduleID_classID_className.csv | awk -F"," '{print $2}' | uniq`; do for j in `grep "^XMLEditor,$i," proj_moduleID_classID_className.csv | awk -F"," '{print $5}'| sed 's/^\///'`; do cp --parents $j component-$i; done; done
