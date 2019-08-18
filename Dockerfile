FROM node:latest
RUN useradd --create-home devenv
WORKDIR /home/devenv
RUN rm -rf /opt/yarn && rm -f /usr/local/bin/yarn && rm -f /usr/local/bin/yarnpkg
USER devenv
RUN git clone --depth 1 https://github.com/theia-ide/ide/theia && \
    cd theia && \
    yarn
EXPOSE 3000
RUN git clone --depth 1 https://github.com/dellamorta/devenv
WORKDIR devenv/config
ENV SHELL /bin/bash
CMD yarn run start --hostname 0.0.0.0.
