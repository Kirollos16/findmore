#!/bin/bash

#colors
red="\e[1;91m"
green="\e[1;92m"
blue="\e[0;94m"
expand_bg="\e[K"
reset="\e[0m"

uline="\e[4m"
bold="\e[1m"

echo -e "${uline}${blod}${blue}${expand_bg}"
npx oh-my-logo "FindMore" nebula --filled
echo -e "${reset}"
echo -e "${blue}${bold}A Comprehensive tool for collection subdomain!${reset}"

# Check if a domain is provided as an argument
if [ -z "$1" ]; then
  echo -e "${red}${bold}Usage: $0 <domain-here>${reset}"
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
subfinder -d $target -all -o subfinder.txt
assetfinder $target -subs-only >> assetfinder.txt
chaos -d $target -o chaos.txt
findomain -q -t $target --unique-output findomain.txt
sublist3r -d $target -n -o sublister.txt
curl -s "https://crt.sh/?q=%25.$target&output=json" | grep -oP '"name_value":"\K[^"]+' | sed 's/\\n/\n/g' | sort -u >> crt.txt


# Combine the output of all tools into a single file
cat subfinder.txt assetfinder.txt chaos.txt findomain.txt sublister.txt crt.txt > combined.txt

# Remove the output files of individual tools
rm subfinder.txt assetfinder.txt chaos.txt findomain.txt sublister.txt crt.txt

# Remove duplicate entries from the combined output file
sort -u combined.txt -o "$output_file"

# Now remove combined file 
rm combined.txt

echo -e "${green}${bold}Subdomain Enumeration For ${bold}${red}$target${reset} ${green}${bold}Is Done. Results saved in ${bold}${red}$output_file${reset}"
echo -e "${green}${bold}Version: ${red}${bold}1.0.0${reset}"
echo -e "${green}${bold}Author: ${red}${bold}Arion${reset}"
