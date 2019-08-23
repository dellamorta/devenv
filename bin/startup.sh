#!/bin/bash
if ! [[ -z "$GITHUB_TOKEN" ]]; then
   git config --global url."https://$GITHUB_TOKEN:@github.com/".insteadOf "https://github.com/"
fi

if ! [[ -z "$GITHUB_EMAIL" ]]; then
   git config --global user.email "$GITHUB_EMAIL"
fi

if ! [[ -z "$GITHUB_NAME" ]]; then
   git config --global user.name "$GITHUB_NAME"
fi

node /home/theia/src-gen/backend/main.js /home/project --hostname=0.0.0.0
