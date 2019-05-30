FROM bubbler9903/coq-gitpod:latest

USER root
RUN add-apt-repository ppa:kelleyk/emacs && \
    apt-get -yq update && \
    apt-get -yq install emacs26-nox
