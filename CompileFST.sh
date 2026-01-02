filepath="$1"
original_directory=$(pwd)
directory=$(dirname "$filepath")
name=$(basename "$filepath" .foma)
binary="$name.bin"
cd "$directory"
foma -e "source $name.foma" -e "push $name" -e "save stack $binary" -e "sigma" -e "exit"
echo "Created Foma binary $binary."
cd "$original_directory"
infile="input.txt"
if [ -f "$infile" ]; then
  flookup -s " ← " -b "$directory/$binary" < "$infile" > output.txt
fi
