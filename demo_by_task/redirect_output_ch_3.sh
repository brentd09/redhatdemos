#!/bin/bash

# Open file descriptor 3 to output.txt
exec 3> output.txt

# Write to file descriptor 3
echo "Writing this to file descriptor 3" >&3

# Close file descriptor 3
exec 3>&-
