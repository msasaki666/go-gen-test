FROM golang:1.22.4
WORKDIR /go-gen-test
RUN apt-get update && \
  apt-get install -y --no-install-recommends sqlite3=3.40.1-2 && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
