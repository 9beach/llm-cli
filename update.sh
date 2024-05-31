#!/bin/bash

sudo curl -L https://raw.githubusercontent.com/9beach/llm-cli/main/gemini-cli -o /usr/local/bin/gemini-cli
sudo curl -L https://raw.githubusercontent.com/9beach/llm-cli/main/claude-cli -o /usr/local/bin/claude-cli
sudo curl -L https://raw.githubusercontent.com/9beach/llm-cli/main/deepl-cli -o/usr/local/bin/deepl-cli
sudo curl -L https://raw.githubusercontent.com/9beach/llm-cli/main/lt-llm-cli -o /usr/local/bin/lt-llm-cli
sudo chmod a+rx /usr/local/bin/gemini-cli /usr/local/bin/claude-cli /usr/local/bin/deepl-cli /usr/local/bin/lt-llm-cli
