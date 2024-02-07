#!/bin/bash

# Check if a git repo already exist ?
if [ -d .git ]; then
    echo "git is already initialized in this folder"
    exit 1
fi

# Init of git repo
git init

# Create a .gitignore file
cat << EOF > .gitignore
.DS_Store
EOF

# Create a .gitattributes file
cat << EOF > .gitattributes
* text=auto eol=lf -whitespace
EOF

# Ask to user if he wants to create a vscode config folder ?
read -p "Do you want to create a vscode config folder ? (Y/n)" response
response=${response:-y}

if [[ $response =~ ^[Yy]$ ]]; then
    mkdir .vscode
    cat << EOF > .vscode/settings.json
{   
    "editor.tabSize": 4,
	"editor.insertSpaces": true,
	"editor.detectIndentation": false,
	"files.trimTrailingWhitespace": true,
	"files.insertFinalNewline": true,
	"files.eol": "\n",
}
EOF
echo "vscode config folder created !"
fi
