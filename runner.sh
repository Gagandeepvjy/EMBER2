#!/bin/bash

# Define the input CSV file
input_csv="new.csv"  # Replace with your actual CSV file path

# Create an output directory if it doesn't exist
mkdir -p output

# Read the CSV file line by line, skipping the header
tail -n +2 "$input_csv" | while IFS=',' read -r gene input_value; do
    # Debugging output
    echo "Processing gene: $gene"

    # Call the Python script with the extracted values
    python predict.py -i "$input_value" -o "output/$gene"

    echo "Processing done gene: $gene"
done
