#!/bin/bash
und import core.xml -db $1.udb 
und metrics $1.udb
awk '!/^File|^Package|^Kind/' $1.csv > metrics/$1_OO-metrics.csv
rm $1.csv
