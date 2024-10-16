#!/bin/bash
LOGFILE_ON="/home/vitor/logs/nginx_on.log"
LOGFILE_OFF="/home/vitor/logs/nginx_off.log"

# Obtém a hora atual
data_hora=$(date +"Data: %d/%m/%Y Hora: %H:%M:%S")

# Verifica o status do Nginx
status=$(systemctl is-active nginx 2>&1)

# Verifica se o Nginx está rodando e determina se vai enviar para o log on ou off
if [ "$status" == "inactive" ]; then
    STATUS=offline
    CURRENT_LOG=$LOGFILE_OFF
else
    STATUS=online
    CURRENT_LOG=$LOGFILE_ON
fi

# Repassa as informações para o arquivo de log correspondente
echo "$data_hora" >> $CURRENT_LOG
echo "Serviço: Nginx" >> $CURRENT_LOG
echo "Status: $status" >> $CURRENT_LOG
echo "O serviço está $STATUS no momento" >> $CURRENT_LOG
echo "" >> $CURRENT_LOG

