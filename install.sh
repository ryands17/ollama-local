#!/bin/bash

set -eu
webuiport="3030"

export WEB_UI_PORT=$webuiport

# Function to check and report on an endpoint
check_endpoint() {
  local url=$1
  if ! curl --output /dev/null --silent --fail -r 0-0 $url; then
    echo "Unable to connect to the endpoint $url"; exit 1
  else
    echo "Endpoint $url is up!"
  fi
}

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
  echo "Homebrew could not be found. Please install it before running this script."
  exit 1
fi

# Install ollama.ai through homebrew if it's not installed already
if ! command -v ollama &> /dev/null; then
  echo "Ollama could not be found, installing..."
  brew install ollama
fi

echo "Killing all previous ollama instances"
pkill -9 ollama || true  # Ignore error if no instance is running

echo "Waiting for ollama to serve"
nohup ollama serve >/dev/null 2>&1 &
# Wait until the server is up (you can adjust this delay as needed)
sleep 5

# Check if ollama is accessible
check_endpoint "http://127.0.0.1:11434"

# Start the Open Web UI container
./dd up -d

# Check if the new Open Web UI is accessible
check_endpoint "http://127.0.0.1:$webuiport"

# Open ollama-webui in your favourite browser
echo "Opening ollama web-ui"
open "http://127.0.0.1:$webuiport"

