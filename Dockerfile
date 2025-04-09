FROM ubuntu

USER root
RUN apt update

# Delete ubuntu user, add hacker user and remove hacker's password
RUN <<EOF
  if id ubuntu; then userdel -f -r ubuntu; fi
  useradd -s /bin/bash -m hacker
  passwd -d hacker

  ln -s /etc/bash.bashrc /etc/bashrc
EOF

RUN apt install python3-flask -y

# Add exec-suid
ADD --chown=0:0 http://github.com/pwncollege/exec-suid/releases/latest/download/exec-suid /usr/bin/exec-suid
RUN chmod 6755 /usr/bin/exec-suid


# USER hacker
