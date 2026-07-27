FROM node:22-alpine

ARG BW_VERSION

RUN npm install -g @bitwarden/cli@${BW_VERSION}

RUN adduser -D -u 1001 bitwarden
USER bitwarden
WORKDIR /home/bitwarden

EXPOSE 8087

ENTRYPOINT ["bw"]
CMD ["serve", "--hostname", "0.0.0.0", "--port", "8087"]
