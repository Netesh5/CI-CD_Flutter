#!/bin/bash

# Extract app version from pubspec.yaml
build_name=$(grep 'version:' pubspec.yaml | awk '{print $2}' | cut -d '+' -f 1 | tr -d ' ')

# Extract build number from app version
if [[ -z "$(grep '+' pubspec.yaml)" ]]; then
  build_number="0"
else
  build_number=$(grep 'version:' pubspec.yaml | awk '{print $2}' | cut -d '+' -f 2 | tr -d ' ')
fi

# Export app version and build number as environment variables
export BUILD_NAME=$build_name
export BUILD_NUMBER=$build_number