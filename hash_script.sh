#!/bin/bash

# Check if an argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <input>"
    exit 1
fi

input="$1"

# Exit if input is not 4 digits
if ! [[ "$input" =~ ^[0-9]{4}$ ]]; then
    echo "Error: Input must be 4 digits."
    exit 1
fi

# Hash the input using SHA-256
output=$(echo -n "$input" | sha256sum | awk '{print $1}')

# Save output to file
echo "$output" > hash_output.txt
