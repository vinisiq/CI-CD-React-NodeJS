#!/bin/bash
nomeApp="hello-react"
cd /hello-react

sudo npm install

sudo npm audit fix --force

sudo supervisord

sudo supervisorctl start $nomeApp