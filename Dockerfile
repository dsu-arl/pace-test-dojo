FROM pwncollege/challenge-legacy

USER root
RUN apt update && apt install -y steghide autopsy

USER hacker
