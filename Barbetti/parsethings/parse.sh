touch newfile.txt
while IFS= read -r line; do
    s="$(cut -d '.' -f1 <<< "$line")"
    grep -q $s newfile.txt 2>/dev/null
    retVal=$?
    if [ $retVal -ne 0 ]; then
        echo $line >> newfile.txt
    fi
done < top20k.txt
