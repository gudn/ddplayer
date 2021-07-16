FROM ubuntu as builder

RUN apt update && apt install -y curl file git unzip zip xz-utils

RUN git clone https://github.com/flutter/flutter.git /flutter -b stable --depth 1
ENV PATH "$PATH:/flutter/bin"
RUN flutter channel stable
RUN flutter upgrade

COPY . /ddplayer
WORKDIR /ddplayer
RUN flutter build web

FROM flashspys/nginx-static
RUN apk update && apk upgrade
COPY --from=builder /ddplayer/build/web /static
