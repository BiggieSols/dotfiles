# This script will recursively go through the current directory and reset perms to 755 (directories) and 644 (files).
# Run this in the directory where you want to fix the files.

# Directories
echo Making all directories 755...
find . -type d -exec chmod 755 {} \;

# Files
echo Making all files 644...
find . -type f -exec chmod 644 {} \;
