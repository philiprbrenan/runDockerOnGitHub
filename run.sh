echo 'Inside container on Ubuntu'

# Configure

apt-get update  -qq
apt-get install -qq build-essential curl git tree

# State

ls -la
pwd
whoami
echo $HOME

# Uv
curl -Ls https://astral.sh/uv/install.sh | bash
export PATH="$HOME/.cargo/bin:$PATH"
source $HOME/.local/bin/env
uv --version
uv venv

# Python

uv pip install ruff
uv run ruff check hello.py

uv run hello.py

echo "Finished"
