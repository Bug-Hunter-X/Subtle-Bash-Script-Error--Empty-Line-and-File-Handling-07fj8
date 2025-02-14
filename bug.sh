#!/bin/bash

# This script attempts to process a file, but it has a subtle error
# related to how it handles empty lines and potential null values.

file_to_process="my_data.txt"

while IFS= read -r line; do
  # Check if line is empty.  The problem is in this section
  if [ -z "$line" ]; then
    echo "Skipping empty line"
    continue
  fi

  # Process the line (example: print it)
  echo "Processing line: $line"
  #Assume this is processing the data in the file
  processed_data="${line// /_}"
  echo "Processed data: $processed_data"
done < "$file_to_process"

#Check if my_data.txt is empty
if [ -s "$file_to_process" ]; then
  echo "File is not empty"
else
  echo "File is empty"
fi