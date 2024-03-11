# START MAQUINA 1 - CTF TU1MILLON 

#!/bin/bash

sudo docker run -d -e DISPLAY=:0.0 -v /tmp/.X11-unix:/tmp/.X11-unix -p 80:80 -p 22:22 --name tu1millon lladosimg
