echo 'Inside container on Ubuntu'

# Configure

apt-get update  -qq                          1>/dev/null 2>/dev/null
apt-get install -qq build-essential curl git 1>/dev/null 2>/dev/null

# Files

ls -la

# Uv
curl -Ls https://astral.sh/uv/install.sh | bash
source $HOME/.local/bin/env
uv --version
uv venv

# Python

uv pip install ruff
uv run ruff check hello.py

uv run hello.py

echo "Finished"
