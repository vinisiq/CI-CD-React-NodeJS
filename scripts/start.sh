#!/bin/bash
nomeApp="hello-react"
cd /hello-react
npm install

sudo supervisord
sudo supervisorctl start $nomeApp