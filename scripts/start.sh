#!/bin/bash
nomeApp="hello-react"
cd /appdir
npm install

sudo supervisord
sudo supervisorctl start $nomeApp