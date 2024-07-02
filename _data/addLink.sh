#!/bin/bash

# Function to add a new component to the YAML file
add_to_yaml() {
  local yaml_file=$1
  local name=$2
  local description=$3
  local link=$4
  local date=$5
  local category=$6
  local tags=$7

  # Append the new component to the YAML file
  echo "" >> "$yaml_file" # start a new line
  echo "- name: $name" >> "$yaml_file"
  echo "  description: $description" >> "$yaml_file"
  echo "  link: $link" >> "$yaml_file"
  echo "  date: $date" >> "$yaml_file"
  echo "  category: $category" >> "$yaml_file"
  echo "  tags: $tags" >> "$yaml_file"
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 7 ]; then
  echo "Usage: $0 <yaml_file> <name> <description> <link> <date> <category> <tags>"
  exit 1
fi

# Get the arguments
yaml_file=$1
name=$2
description=$3
link=$4
date=$5
category=$6
tags=$7

# Add the new component to the YAML file
add_to_yaml "$yaml_file" "$name" "$description" "$link" "$date" "$category" "$tags"

echo "Component added to $yaml_file successfully."

