#!/bin/bash

# Parse arguments
organization=$1
repository=$2

# Set the URL for the repository
url="https://github.com/$organization/$repository"

# Use curl to get the HTTP status code
status_code=$(curl --write-out %{http_code} --silent --output /dev/null $url)

# Check if the status code is not 404
if [[ "$status_code" == "404" ]]; then
  echo "{ \"exists\": \"false\" }"
else
  echo "{ \"exists\": \"true\" }"
fi
