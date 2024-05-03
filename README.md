# Ollama LLM test

This is a simple starter to run Ollama LLM models on your local machine. I am currently using these to for code assistance and it's been a nice experience so far.

## Requirements

- Curl
- Docker
- Homebrew

## Instructions

- Clone this repo
- Run the install script `./install.sh`. This will install Ollama CLI and run the Open Web UI from where you can interact with any model needed
- Open [http://localhost:3030](http://localhost:3030) and enjoy!

## Other commands

- You can interact with the docker compose file via the `dd` script. For e.g. stopping the container would be `./dd down`
- Installing Ollama models is also easy as shown [here](https://ollama.com/library/deepseek-coder:33b). For e.g. using the CLI, you can do `ollama run deepseek-coder:33b` to install the deepseek model

**Note**: This setup is designed for Mac systems, so please tweak it accordingly to your OS.
