#!/bin/bash

ollama list | tail -n +2 | awk '{print $1}' | xargs -L 1 ollama pull
