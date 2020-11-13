#!/bin/bash

# Delete the hidden PHP file
find ./ -name .*.php -exec rm -rf {} \;

# Delete the .DS_store file
find ./ -name .DS_store -exec rm -rf {} \;

