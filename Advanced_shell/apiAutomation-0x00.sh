#!/bin/bash

# API endpoint
URL="https://pokeapi.co/api/v2/pokemon/pikachu"

# Output file
OUTPUT_FILE="data.json"
ERROR_FILE="errors.txt"

# Make the API request
RESPONSE=$(curl -s -w "%{http_code}" -o "$OUTPUT_FILE" "$URL")

# Check if the request was successful (HTTP 200)
if [ "$RESPONSE" -ne 200 ]; then
  echo "[$(date)] Failed to fetch Pikachu data. HTTP status: $RESPONSE" >> "$ERROR_FILE"
  rm -f "$OUTPUT_FILE"  # Remove incomplete data file
fi
