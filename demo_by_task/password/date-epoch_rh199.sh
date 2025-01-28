#!/bin/bash

# Function to convert epoch to date
convert_epoch_to_date() {
    epoch_value=$1
    date_value=$(date -d @$epoch_value)
    echo "Epoch Value: $epoch_value"
    echo "Converted Date: $date_value"
}

# Function to convert date to epoch
convert_date_to_epoch() {
    date_input=$1
    epoch_value=$(date -d "$date_input" +%s)
    echo "Date: $date_input"
    echo "Converted Epoch Value: $epoch_value"
}

# Function to validate date format
validate_date_format() {
    date_input=$1
    # Check for the format: YYYY-MM-DD HH:MM:SS
    if [[ ! "$date_input" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}\ [0-9]{2}:[0-9]{2}:[0-9]{2}$ ]]; then
        echo "Error: Date must be in the format 'YYYY-MM-DD HH:MM:SS'."
        exit 1
    fi
}

# Main logic to determine input type
if [[ "$#" -eq 1 ]]; then
    if [[ "$1" =~ ^[0-9]+$ ]]; then
        # Call function to convert epoch to date
        convert_epoch_to_date "$1"
    else
        # Validate date format before conversion
        validate_date_format "$1"
        # Call function to convert date to epoch
        convert_date_to_epoch "$1"
    fi
else
    echo "Usage: $0 <epoch_value or date>"
    exit 1
fi
