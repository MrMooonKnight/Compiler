#!/bin/bash

# Define ASCII art for header and footer
HEADER="
                                                                                                           
   ███▄ ▄███▓ ██▀███   ▄▄▄▄    ██▓    ▄▄▄       ▄████▄   ██ ▄█▀ ██░ ██ ▓█████ ▄▄▄       ██▀███  ▄▄▄█████▓  
  ▓██▒▀█▀ ██▒▓██ ▒ ██▒▓█████▄ ▓██▒   ▒████▄    ▒██▀ ▀█   ██▄█▒ ▓██░ ██▒▓█   ▀▒████▄    ▓██ ▒ ██▒▓  ██▒ ▓▒  
  ▓██    ▓██░▓██ ░▄█ ▒▒██▒ ▄██▒██░   ▒██  ▀█▄  ▒▓█    ▄ ▓███▄░ ▒██▀▀██░▒███  ▒██  ▀█▄  ▓██ ░▄█ ▒▒ ▓██░ ▒░  
  ▒██    ▒██ ▒██▀▀█▄  ▒██░█▀  ▒██░   ░██▄▄▄▄██ ▒▓▓▄ ▄██▒▓██ █▄ ░▓█ ░██ ▒▓█  ▄░██▄▄▄▄██ ▒██▀▀█▄  ░ ▓██▓ ░   
  ▒██▒   ░██▒░██▓ ▒██▒░▓█  ▀█▓░██████▒▓█   ▓██▒▒ ▓███▀ ░▒██▒ █▄░▓█▒░██▓░▒████▒▓█   ▓██▒░██▓ ▒██▒  ▒██▒ ░   
  ░ ▒░   ░  ░░ ▒▓ ░▒▓░░▒▓███▀▒░ ▒░▓  ░▒▒   ▓▒█░░ ░▒ ▒  ░▒ ▒▒ ▓▒ ▒ ░░▒░▒░░ ▒░ ░▒▒   ▓▒█░░ ▒▓ ░▒▓░  ▒ ░░     
  ░  ░      ░  ░▒ ░ ▒░▒░▒   ░ ░ ░ ▒  ░ ▒   ▒▒ ░  ░  ▒   ░ ░▒ ▒░ ▒ ░▒░ ░ ░ ░  ░ ▒   ▒▒ ░  ░▒ ░ ▒░    ░      
  ░      ░     ░░   ░  ░    ░   ░ ░    ░   ▒   ░        ░ ░░ ░  ░  ░░ ░   ░    ░   ▒     ░░   ░   ░        
         ░      ░      ░          ░  ░     ░  ░░ ░      ░  ░    ░  ░  ░   ░  ░     ░  ░   ░                
                            ░                  ░                                                           "

FOOTER="---------------------------------------------------"

# Clear the terminal
clear


# Check if a filename has been provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <filename.cpp>"
    read -p "Enter the name of the C++ file you want to compile: " filename
else
    filename=$1
fi

# Get the filename and remove the .cpp extension
filename=$(basename "$filename" .cpp)

# Compile the file using g++
echo -e "\033[40m$HEADER\033[0m"
echo -e "\n"

# Copyrights

echo "$FOOTER"
echo -e "\033[31mCopyright © $(date +%Y) mrblackheart. All rights reserved.\033[0m"
echo "$FOOTER"
echo -e "\n"
echo "$FOOTER"


echo -e "\033[34mCompiling $1 ...\033[0m"
echo "$FOOTER"
g++ -Wall -o "$filename" "$filename.cpp"

# Check if the compilation was successful
if [ $? -eq 0 ]; then
   
    echo -e "\033[32mCompilation Successful :)\033[0m"
    echo -e "\033[33mExecuting \"$filename\" ...\033[0m"
    echo "$FOOTER"
    echo -e "\n\n"
    ./"$filename"
    echo -e "\n\n"
    echo "$FOOTER"
        
else
    echo "$FOOTER"
    echo -e "\033[31mCompilation Failed! :(\033[0m"
    echo "$FOOTER"
fi
