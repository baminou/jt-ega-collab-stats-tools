#!/bin/bash

#### This scripts calculates the total file size uploaded in an EGA-Collaboratory transfer for ICGC
#### Run:
####     ./jt_total_upload_size.sh jtracker-job-folder1 jtracker-job-folder-2 jtracker-job-folder-3 ...

for folder in $@
do
    if [ ! -d $folder ]
    then
        echo "Error: Folder $folder does not exist or is not a folder" 1>&2
        exit 64
    fi
done


sum=0
for jt_folder in $@
do
    total=`find $jt_folder -name "task.upload.*.json" | grep task_state.completed | grep job_state.completed | while read line; do cat $line|jq .input.file_size;done | paste -sd+ - | bc`
    sum=$((sum+total))
done

echo $sum
