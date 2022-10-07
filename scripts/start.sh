#!/bin/bash
nomeApp="hello-react"
sudo cd /hello-react
sudo npm install

sudo supervisord
sudo supervisorctl start $nomeApp