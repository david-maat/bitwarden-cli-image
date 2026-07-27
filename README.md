# bitwarden-cli-image
A docker image for bitwarden cli, based on alpine node image and the npm package released by bitwarden. Do not expose this image, it is intended for CI/CD use-cases. 
This image is automatically rebuilt daily at 00:00 to incorporate updates from the underlying base node image and the Bitwarden CLI package. Note that only the latest CLI version receives continuous node environment updates.

## Environment Variables

You can configure and authenticate the Bitwarden CLI inside the container using the following environment variables:

### Authentication

*   **`BW_CLIENTID`**: Your API Client ID (Used for API key authentication).
*   **`BW_CLIENTSECRET`**: Your API Client Secret (Used for API key authentication).
*   **`BW_PASSWORD`**: Your master password. Required to unlock the vault when using API key authentication so `bw serve` can access secrets.
*   **`BW_SESSION`**: The active session token (if you have already authenticated and unlocked the vault elsewhere).

### Configuration

*   **`BW_HOST`**: The URL of your Bitwarden or Vaultwarden instance if you are self-hosting (e.g., `https://bitwarden.yourdomain.com`).

### Example Usage

```bash
docker run -d \
  -p 8087:8087 \
  -e BW_CLIENTID="your_client_id" \
  -e BW_CLIENTSECRET="your_client_secret" \
  -e BW_PASSWORD="your_master_password" \
  ghcr.io/david-maat/bitwarden-cli-image:latest
```
