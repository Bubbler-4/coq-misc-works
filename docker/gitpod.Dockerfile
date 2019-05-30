FROM bubbler9903/coq-gitpod:latest

USER root
RUN add-apt-repository ppa:kelleyk/emacs && \
    apt update && \
    apt install emacs26-nox

USER gitpod
RUN emacs --script install.el
