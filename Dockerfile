FROM digitalsleuth/autopsy:latest

USER root
RUN apt update && apt install -y steghide

# Delete ubuntu user, add hacker user and remove hacker's password
RUN <<EOF
  if id autopsy; then userdel -f -r autopsy; fi
  useradd -s /bin/bash -m hacker
  passwd -d hacker

  ln -s /etc/bash.bashrc /etc/bashrc
EOF

# Add exec-suid
ADD --chown=0:0 http://github.com/pwncollege/exec-suid/releases/latest/download/exec-suid /usr/bin/exec-suid
RUN chmod 6755 /usr/bin/exec-suid


USER hacker
