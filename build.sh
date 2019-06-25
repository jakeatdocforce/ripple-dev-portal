#!/bin/bash
# ###
# - First build English
# - Build next target
#   --no_static  to not create new static files. All come from root dir
#   -- specify output sub folder for new html

###
start=`date +%s`

#
echo "Building target - English first"

dactyl_build

echo "Building target - JP"

#  change to separate config file for each lang
dactyl_build -c dactyl-config-jp.yml --no_static --out_dir out/jp


# see how long script takes to build. 
end=`date +%s`
runtime=$((end-start))

echo "BUILD TOOK > " $runtime

# start local server for testing. 
# 
http-server out




## Steps to create new language
# 1 copy dactyl-config.yml to dactyl-confgi{newlang}.yml
# 2 change name and values to new lanugage. 
# 3 copy and change any needed template files with translations needed.  <- future idea to extract all text from template. 
# 4 copy and translate any .md files needed in content folder.  
# 5 make sure each change is reflected in new config file.  Any md: or template: lines
# 6 add new build call above. 



#### other notes
## reason to move from single config
# - 3k lines already.  Each lang could add ~300 to file
# - more flexible to edit each lang

# Potential issues
#  - if English is changed how will we match up with language version of config
#  - if english md or template file is changed how will we trigger alert to watch and notifiy to update translations. 

### Future ideas
# refactor/extract all text from template files.  move to sepcfic language file. 
# separate translations to folders? Vs keeping them all next to each other.  Maybe not an issue. 
# print report of pages in english
# print report of pages in (lang) that do match to english
# print report of modified md or template files for english
# save running list of past changed files? 
# remove need for targets: -jp in config files.  As each file is unique to that language this seems redundant?
 