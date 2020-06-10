#!/bin/bash

echo "Currently Logged User and their login name: $(id -un)"
echo "Current Shell : $SHELL"
echo "Home Directory: $HOME"
echo "Operating System Type: $OSTYPE"
echo "Current Path Setting: $PATH"
echo "Current Working Directory:" 
pwd
echo "Number of users currently logged in:"
users

