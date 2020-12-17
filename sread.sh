#!/bin/bash

mkdir -p read 

find ./$1 -name "*.java" > myFiles.txt
for i in `cat myFiles.txt`; do printf "$i\t" >> read/readability-$1.csv && cat $i | java -jar readability.jar | sed -n 3p >> read/readability-$1.csv; done
