FROM alpine:latest
LABEL maintainer="Yasuhiro Kiyota <yasuhiroki.duck@gmail.com>"

LABEL "com.github.actions.name"="GitHub Actions Guard Autosquash Commit"
LABEL "com.github.actions.description"="GitHub Actions to guard merge when commit message contains autosquash prefix"
LABEL "com.github.actions.icon"="activity"
LABEL "com.github.actions.color"="red"

RUN apk add --no-cache \
        git \
        bash \
        jq

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
