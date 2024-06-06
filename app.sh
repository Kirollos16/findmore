#!/bin/bash

# Check if a domain is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <domain>"
  exit 1
fi

target=$1

# Function to generate a unique filename
generate_filename() {
  base_name=$1
  counter=1
  while [[ -e "${base_name}-${counter}.txt" ]]; do
    counter=$((counter + 1))
  done
  echo "${base_name}-${counter}.txt"
}

output_file="subdomains.txt"
if [[ -e $output_file ]]; then
  output_file=$(generate_filename "subdomains")
fi

# Run subdomain enumeration tools and append results to the output file
subfinder -d $target -all >> subfinder.txt
assetfinder $target -subs-only >> assetfinder.txt
chaos -d $target -silent >> chaos.txt
findomain -t $target >> findomain.txt
sublist3r -d $target >> sublister.txt

# Combine the output of all tools into a single file
cat subfinder.txt assetfinder.txt chaos.txt findomain.txt sublister.txt > combined.txt

# Remove the output files of individual tools
rm subfinder.txt assetfinder.txt chaos.txt findomain.txt sublister.txt

# Remove duplicate entries from the combined output file
sort -u combined.txt -o "$output_file"

# Now remove combined file 
rm combined.txt

echo "Subdomain Enumeration Is Done. Results saved in $output_file"
