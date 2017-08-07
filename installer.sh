#!/bin/bash

echo "Moving .vim and .vimrc for the home and deleting repository"
mv .vim .vimrc ~/
cd ..
rm -rf vim-files
