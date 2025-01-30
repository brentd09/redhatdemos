#!/bin/bash

# Function to keep the CPU busy
cpu_stress() {
    while :; do
        # This calculation will keep the CPU busy
        echo "scale=10; 4*a(1)" | bc -l | awk '{print $0}' > /dev/null
    done
}

# Launch multiple CPU-hogging processes in the background
for i in $(seq 1 $(nproc)); do
    cpu_stress &
done

# Wait for user to stop the script
echo "CPU stressed. Press [CTRL+C] to stop."

# Wait for all background processes to finish before exiting
wait
