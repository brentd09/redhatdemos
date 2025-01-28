#!/bin/bash

# Set the number of files and size
FILE_COUNT=100
FILE_SIZE_MB=50
DIRECTORY="./disk_io_test"

# Create a directory to store files
mkdir -p $DIRECTORY

# Generate files with random data
for i in $(seq 1 $FILE_COUNT); do
    # Create a large file by writing random data from /dev/urandom
    dd if=/dev/urandom of=$DIRECTORY/file$i.bin bs=1M count=$FILE_SIZE_MB *> /dev/null
    # Alternatively, you can use /dev/zero for zeroed files:
    # dd if=/dev/zero of=$DIRECTORY/file$i.bin bs=1M count=$FILE_SIZE_MB
done

