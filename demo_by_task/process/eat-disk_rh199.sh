#!/bin/bash

# Set the number of files and size
FILE_COUNT=100
FILE_SIZE_MB=50
DIRECTORY="./disk_io_test"

# Create directory to store files
mkdir -p $DIRECTORY

# Generate files
for i in $(seq 1 $FILE_COUNT); do
    # Create a large file by writing random data
    fallocate -l ${FILE_SIZE_MB}M $DIRECTORY/file$i.bin
    # Alternatively, you can use:
    # head -c ${FILE_SIZE_MB}M </dev/urandom > $DIRECTORY/file$i.bin
done

echo "Created $FILE_COUNT files of size ${FILE_SIZE_MB}MB in $DIRECTORY."
