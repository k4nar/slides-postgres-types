#!/bin/sh

# the server must run (npm start) at localhost:8000

docker pull astefanutti/decktape
docker run --rm --net=host -v `pwd`:/slides astefanutti/decktape -s 1366x768 http://localhost:8000 slides.pdf
