FROM bubbler9903/coq-gitpod:vnc-latest

USER root

# Replace VNC startup script
RUN rm -f /usr/bin/start-vnc-session.sh
COPY start-vnc-session.sh /usr/bin/
RUN chmod +x /usr/bin/start-vnc-session.sh
