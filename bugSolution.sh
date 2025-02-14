#!/bin/bash

# Improved script to handle empty lines and empty files more robustly

file_to_process="my_data.txt"

# Check if the file exists and is not empty before processing
if [ -s "$file_to_process" ]; then
  while IFS= read -r line; do
    # More robust empty line check
    if [[ -z "$line" ]]; then
      echo "Skipping empty line"
      continue
    fi

    # Process the line
    echo "Processing line: $line"
    processed_data="${line// /_}"
    echo "Processed data: $processed_data"
  done < "$file_to_process"
else
  echo "Error: The file '$file_to_process' is empty or does not exist."
fi
