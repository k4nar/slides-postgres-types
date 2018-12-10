#!/bin/sh

# the server must run (npm start) at localhost:8000

docker pull astefanutti/decktape:2.8.5
docker run --rm --net=host -v `pwd`:/slides astefanutti/decktape:2.8.5 -s 1920x1080 http://localhost:8000 slides.pdf
