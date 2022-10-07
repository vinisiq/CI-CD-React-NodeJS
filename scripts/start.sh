#!/bin/bash
nomeApp="hello-react"
cd /hello-react/
sudo npm install

sudo supervisord
sudo supervisorctl start $nomeApp