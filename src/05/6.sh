directory=$1


#6 Top 10 executable files with largest size in descending order (path, size and hash)
echo 'Top 10 executable file of the maximum size arranged in descending order (path, size and MD5 hash of file):'
top_10=$(find $directory -type f -printf '%p %s\n' | grep -e '.exe' -e '.elf' | sort -n -r -k2 | nl | numfmt --to=iec --field=3 | head -10) 

top_10_with_hash=$(while IFS= read -r line ;
                    do
                        line_array=($line)
                        hash=$(md5sum ${line_array[1]}) #filename is the second word in each line
                        hash_array=($hash)
                        echo $line' '${hash_array[0]}   #hash is the first word of md5sum output
                    done <<< "$top_10")

echo "$top_10_with_hash" | awk '{print $1 " - " $2 ", " $3 ", " $4}' | column -t
