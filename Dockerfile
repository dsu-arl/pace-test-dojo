FROM ubuntu:latest

USER root
RUN apt update && apt install -y steghide autopsy

USER hacker
