read file
filesize=`wc -c $file`
size="$(wc -c < "$file")"
echo 'size >' $size
line="$(wc -l < "$file")"
echo 'line-count >' $line
word="$(wc -w < "$file")"
echo 'word-count >' $word

i=1
while IFS= read -r line; do
    word=`echo "$line" | wc -w`
    printf 'Line No:%d-Count of words:%d\n' "$i" "$word"
    ((i=i+1))
done < $file

inp="$file"
grep -E -o '\w++' "$inp" | sort >"nfile.txt"
uniq -c "nfile.txt" > "$inp"
while read -r line;
do
array=($line)
if (($((${array[0]}-1))==0))
then
continue
else
echo "Word : ${array[1]} - Count of Repetitions:$((${array[0]}-1))"
fi
done < "$inp"
rm "nfile.txt"