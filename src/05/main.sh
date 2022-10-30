directory=$1

start=`date +%s.%N`

#1 Total number of folders, including subfolders
number_of_folders=$(find $directory -type d | wc -l)
echo -n 'Total number of folders (including all nested ones) = '
echo $number_of_folders


#2 Top 5 folders with largest size in descening order (path and size)
top_5_folders=$(find $directory -type d -printf '%p %s\n' | sort -r -n -k2 | nl | numfmt --to=iec --field=3 | awk '{ print $1 " - " $2 ", " $3 }' | head -5 | column -t)
echo 'TOP 5 folders of maximum size size arranged in descending order (path and size):'
echo "$top_5_folders"


#3 Total number of files
total_files=$(find $directory -type f | wc -l)
echo -n 'Total number of files = '
echo $total_files


#4 Number of configuration files (with .conf extension), text files,
# executable files, log files (files with .log extension), archives, symbolic links
conf_files=$(find $directory -type f | grep .conf | wc -l)
echo -n 'Configuration files (with the .conf extension) = '
echo $conf_files

text_files=$(find $directory -type f | grep .txt | wc -l)
echo -n 'Text files = '
echo $text_files

executable_files=$(find $directory -type f | grep -e .exe -e .elf | wc -l)
echo -n 'Executable files = '
echo $executable_files

log_files=$(find $directory -type f | grep .log | wc -l)
echo -n 'Log files (with the extension .log) = '
echo $log_files

archive_files=$(find $directory -type f | grep -e .tar.gz -e .tar -e .gz -e .zip -e .lzo -e lz4 | wc -l)
echo -n 'Archive files = '
echo $archive_files

symbolic_links=$(find $directory -type l | wc -l)
echo -n 'Symbolic links = '
echo $symbolic_links


#5 Top 10 files with largest size in descending order (path, size and type)
echo 'Top 10 files of maximum size arranged in descending order (path, size and type):'
top_10=$(find $directory -type f -printf '%p %s\n' | awk -F '.' '{print $0 " " $NF}' | sort -n -r -k2 | nl | numfmt --to=iec --field=3 | awk '{print $1 " - " $2 ", " $3 ", " $4}' | column -t | head -10)
echo "$top_10"


#6 Top 10 executable files with largest size in descending order (path, size and hash)
bash 6.sh $directory


#7 Execution time of the script
end=`date +%s.%N`
execution_time=$(echo "$end-$start" | bc -l | numfmt --format="%0.1f")
echo 'Script execution time (in seconds) = '$execution_time