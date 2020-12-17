# number of modules per project

for i in `awk -F ',' '{print $1}' proj_moduleID_classID_className.csv | sort | uniq`; do printf "$i\t" && grep "$i," proj_moduleID_classID_className.csv | awk -F"," '{print $2}'|sort -n -r|uniq | head -1; done
