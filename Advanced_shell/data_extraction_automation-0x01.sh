#!/bin/bash

# Ensure data.json exists
if [ ! -f data.json ]; then
  echo "data.json not found. Please run the API request script first."
  exit 1
fi

# Extract values using jq
name=$(jq -r '.name' data.json | sed 's/.*/\u&/')
height=$(jq -r '.height' data.json)
weight=$(jq -r '.weight' data.json)
type=$(jq -r '.types[0].type.name' data.json | sed 's/.*/\u&/')

# Convert height (decimetres to metres), weight (hectograms to kg)
height_m=$(awk "BEGIN { printf \"%.1f\", $height / 10 }")
weight_kg=$(awk "BEGIN { printf \"%.0f\", $weight / 10 }")

# Output
echo "$name is of type $type, weighs ${weight_kg}kg, and is ${height_m}m tall."
