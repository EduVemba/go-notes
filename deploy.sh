#!/bin/bash

APP_DIR="/home/appuser/go-notes"
SERVICE_NAME="go-notes.service"
USER_TO_RESTART="go-notes-app"

echo "Iniciando deployment..."
cd $APP_DIR

echo "Executando git pull..."
git pull

# Recompilar a aplicação (garante que está atualizado)
echo "Recompilando a aplicação..."

# Assume que a dependência foi feita anteriormente
go build -o go-notes-app . 

# Reiniciar o serviço systemd
echo "Reiniciando o serviço systemd..."
sudo systemctl restart $SERVICE_NAME

echo "Deployment concluído. Verifique o status: sudo systemctl status $SERVICE_NAME"
