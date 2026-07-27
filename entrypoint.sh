#!/bin/sh
set -e

# 1. Configure the server URL if provided
if [ -n "$BW_HOST" ]; then
  echo "Configuring server to $BW_HOST..."
  bw config server "$BW_HOST"
fi

# 2. Login if API keys are provided
if [ -n "$BW_CLIENTID" ] && [ -n "$BW_CLIENTSECRET" ]; then
  echo "Logging in with API keys..."
  bw login --apikey
fi

# 3. Unlock the vault if password is provided
if [ -n "$BW_PASSWORD" ]; then
  echo "Unlocking vault..."
  export BW_SESSION=$(bw unlock --passwordenv BW_PASSWORD --raw)
  echo "Vault unlocked successfully."
fi

# 4. Start the command passed to the container (default: bw serve ...)
echo "Executing: $@"
exec bw "$@"
