#!/bin/bash

# Function to handle the termination signal
cleanup() {
    echo ""
    echo "Caught termination signal. Exiting..."
    exit 0
}

# Trap SIGINT and SIGTERM signals and call the cleanup function
trap cleanup SIGINT SIGTERM

# Main script loop
while true; do
    echo "Running... (Press Ctrl+C to stop)"
    sleep 1
done
