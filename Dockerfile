FROM kong:latest

USER root

RUN apt-get update && \
    apt-get install -y git luarocks libssl-dev && \
    rm -rf /var/lib/apt/lists/*

COPY . /tmp/kong-oidc-auth

WORKDIR /tmp/kong-oidc-auth

RUN luarocks make

RUN chown -R kong:kong \
    /usr/local/lib/luarocks/rocks-5.1/kong-oidc-auth \
    /usr/local/share/lua/5.1/kong \
    /usr/local/share/lua/5.1/kong/plugins/kong-oidc-auth

USER kong
