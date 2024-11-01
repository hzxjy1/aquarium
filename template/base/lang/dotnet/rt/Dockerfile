FROM alpine:latest

ENV DOTNET_VERSION=8.0.10

RUN apk add --no-cache libstdc++ gcc && \
    wget -O dotnet.tar.gz https://dotnetcli.azureedge.net/dotnet/Runtime/$DOTNET_VERSION/dotnet-runtime-$DOTNET_VERSION-linux-musl-x64.tar.gz && \
    dotnet_sha512='2d6edcc14b9d9fef93ac72fb32b17a6318f2af5bdd83c4b34b35c591dcd406da4d489c1a4d5808a61bac2ee14b40bb6b0e8ffe9b424901b70fe2d969deffa087' && \
    echo "$dotnet_sha512  dotnet.tar.gz" | sha512sum -c - && \
    mkdir -p /usr/share/dotnet && \
    tar -oxzf dotnet.tar.gz -C /usr/share/dotnet && \
    rm dotnet.tar.gz && \
    ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet
