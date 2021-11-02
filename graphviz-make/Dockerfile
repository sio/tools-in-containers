FROM debian:stable-slim
RUN \
    apt-get update && \
    apt-get install -y \
        graphviz \
        && \
    apt-get clean
RUN \
    apt-get install -y --no-install-recommends \
        python3 \
        python3-venv \
        make \
        && \
    apt-get clean
