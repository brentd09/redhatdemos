#!/bin/bash

# Function to keep the CPU busy
cpu_stress() {
    while :; do
        # This calculation will keep the CPU busy
        echo "scale=10; 4*a(1)" | bc -l | awk '{print $0}' > /dev/null
    done
}

# Launch the CPU-hogging process in the background
cpu_stress &


# Wait for user to stop the script
# Wait for all background processes to finish before exiting
wait
