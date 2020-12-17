#!/bin/bash

# extract OO metrics
find ./$1 -name "*.java" > myFiles.txt
und -quiet create -db $1.udb -languages Java add @myFiles.txt analyze -all
und import core.xml -db $1.udb 
und metrics $1.udb
awk '!/^File|^Package|^Kind/' $1.csv > metrics/$1_OO-metrics.csv
rm $1.csv

# extract readability metrics
mkdir -p read
find ./$1 -name "*.java" > myFiles.txt
for i in `cat myFiles.txt`; do printf "$i\t" >> read/readability-$1.csv && cat 
$i | java -jar readability.jar | sed -n 3p >> read/readability-$1.csv; done
