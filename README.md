# HelloReact app

## Available Scripts

In the project directory, you can run:

### `npm install`

To install the dependencies package.

### `npm start`

Runs the app in the development mode.<br />
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

The page will reload if you make edits.<br />
You will also see any lint errors in the console.
# CI-CD-React-NodeJS
# CI-CD-React-NodeJS



#!/bin/bash

# VARIAVEIS
# Substituir com o nome desejado para a aplicação
diretorio="/hello-react"
comando="npm start"
nomeaplicacao="hello-react"


# Atualizando os pacotes
sudo apt-get update

# Instalando o Ruby
sudo apt-get install ruby -y

# Instalando o agente do CodeDeploy
wget https://aws-codedeploy-us-east-2.s3.us-east-2.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto

# Criando diretório para a aplicação
sudo mkdir ${diretorio}
#permissões
sudo chown -R root:root ${diretorio}/*

# Baixando e instalando o NodeJs
sudo apt install npm -y
sudo npm cache clean -f
sudo npm install -g n
sudo n stable

# Configurando diretórios para os logs do supervisor
sudo mkdir /logs
sudo mkdir /logs/app
sudo mkdir /logs/app/stderr
sudo mkdir /logs/app/stdout
sudo chown -R ubuntu:ubuntu /logs/*

# Baixando e instalando o supervisor
sudo apt install python3-pip -y
sudo su
pip install supervisor
echo_supervisord_conf > /etc/supervisord.conf

echo "
[program:${nomeaplicacao}]
command=${comando}            ; the program (relative uses PATH, can take args)
process_name=%(program_name)s ; process_name expr (default %(program_name)s)
directory=${diretorio}        ; directory to cwd to before exec (def no cwd)
autostart=true                ; start at supervisord start (default: true)
startsecs=15                  ; # of secs prog must stay up to be running (def. 1)
startretries=3                ; max # of serial start failures when starting (default 3)
autorestart=unexpected        ; when to restart if exited after running (def: unexpected)
user=ubuntu                   ; setuid to this UNIX account to run the program
stdout_logfile=/logs/app/stdout/stdout.log ; stdout log path, NONE for none; default AUTO
stdout_logfile_maxbytes=1MB   ; max # logfile bytes b4 rotation (default 50MB)
stdout_logfile_backups=10     ; # of stdout logfile backups (0 means none, default 10)
stdout_capture_maxbytes=1MB   ; number of bytes in 'capturemode' (default 0)
stderr_logfile=/logs/app/stderr/stderr.log ; stderr log path, NONE for none; default AUTO
stderr_logfile_maxbytes=1MB   ; max # logfile bytes b4 rotation (default 50MB)
stderr_logfile_backups=10     ; # of stderr logfile backups (0 means none, default 10)
stderr_capture_maxbytes=1MB   ; number of bytes in 'capturemode' (default 0))" >> /etc/supervisord.conf

exit