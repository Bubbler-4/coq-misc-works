FROM bubbler9903/coq-gitpod:vnc-latest

USER root

# Replace VNC startup script
RUN sed -i 's/1920x1080/1800x900/g' /usr/bin/start-vnc-session.sh
