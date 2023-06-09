# syntax=docker/dockerfile:1
FROM mcr.microsoft.com/dotnet/sdk:6.0

RUN apt-get update
RUN apt-get install -y \
    python3-venv \
    bash \
    curl \
    git

ENV GOSU_VERSION 1.10
RUN curl -sS -Lo /usr/bin/gosu https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-amd64
RUN chmod +x /usr/bin/gosu

ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV GIST_URL https://gist.githubusercontent.com/LucasVmigotto/c9e335f85acb9bc27f0504563419a80a/raw/2f7f161a41e68bc6f266ef73a126458dd32416fd/entrypoint.sh
RUN curl -sS $GIST_URL > /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT [ "/usr/bin/entrypoint.sh" ]
CMD [ dotnet ]
