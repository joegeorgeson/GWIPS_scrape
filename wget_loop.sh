#!/bin/bash

# Check if a filename is provided as an argument
if [ $# -eq 0 ]; then
  echo "Please provide the filename as an argument."
  exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
  echo "File '$1' does not exist."
  exit 1
fi

# Read the file line by line and download each line
while IFS= read -r line; do
  # Download the line using curl or wget (choose either one)
  #curl -O "$line"  # Uncomment this line for curl
  wget --no-check-certificate "$line"    # Uncomment this line for wget

  # Optional: Print the downloaded line
  echo "Downloaded: $line"
done < "$1"

echo "Download complete."
