FROM node:22-alpine

ARG BW_VERSION

RUN apk add --no-cache jq

RUN npm install -g @bitwarden/cli@${BW_VERSION}

RUN adduser -D -u 1001 bitwarden
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

USER bitwarden
WORKDIR /home/bitwarden

EXPOSE 8087

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["serve", "--hostname", "0.0.0.0", "--port", "8087"]

