#!/bin/bash
# ###
# - First build English
# - Build next target
#   --no_static  to not create new static files. All come from root dir
#   -- specify output sub folder for new html

###
start=`date +%s`

targets=`dactyl_build -lq | awk '{print $1}'`

while read -r line; do
    echo ""
    echo "======================================="
    echo "Building Target: $line"

    if [ "$line" == "en" ]; then
        echo "Building english first"
        dactyl_build -q -t "$line" --vars "tool/strings_${line}.yaml"
    else
        echo "Building other language"
        dactyl_build -q -t "$line" --vars "tool/strings_${line}.yaml" --no_static --out_dir out/"$line"
    fi

done <<< "$targets"

echo ""
echo "======================================="
echo "======================================="
echo ""
end=`date +%s`
runtime=$((end-start))
echo "BUILD TOOK > " $runtime
