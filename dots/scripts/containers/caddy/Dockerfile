FROM docker.io/caddy:2.7.4-builder AS builder

RUN xcaddy build v2.7.4 --with github.com/caddy-dns/cloudflare@latest

FROM docker.io/caddy:2.7.4

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
