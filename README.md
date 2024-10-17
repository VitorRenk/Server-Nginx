
# Ferramenta WSL e Servidor Nginx

## 1- Instalação do Ubuntu e WSL

### WSL é uma ferramenta do Windows que permite executar binários e scripts do Linux, facilitando a integração entre os dois sistemas operacionais e tornando o desenvolvimento e a administração de sistemas mais ágeis e eficientes.

Primeiramente devemos ativar alguns recursos do Windows para que tudo funcione corretamente:

#### Menu Iniciar - Ativar ou desativar recursos do Windows - Selecionar: Plataforma de máquina virtual, Plataforma de hipervisor do Windows, Subsistema de Windows para Linux.

![features](https://github.com/user-attachments/assets/25e3bbd9-9ca0-4549-b6bd-92b373fe6f76)

Para conseguir utilizar o WSL, é necessário atualizar o kernel do Linux para WSL com o seguinte pacote:
https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi

Depois disso é necessário reiniciar a máquina para aplicar essas alterações.

Após isso, é importante atualizar o WSL caso ele não esteja, utilizando o PowerShell, com os seguintes comandos:
```
apt-get update
wsl --update
```
![wsl](https://github.com/user-attachments/assets/661171aa-3270-4d41-b950-fbb0d90a0ebe)

A próxima etapa é ir até a Microsoft Store e baixar e instalar o Ubuntu 20.04.6 LTS ou qualquer outro acima da versão 20.04.

![ubuntu](https://github.com/user-attachments/assets/8a30dfb1-e13f-483d-a82f-895e161ccb8f)

Com isso, podemos abrir o Ubuntu para iniciar o desenvolvimento na ferramenta WSL. Abrindo ele, podemos perceber que ele vai pedir para informar o nome de usuário e senha para iniciar o ambiente.

![user](https://github.com/user-attachments/assets/a1e8c8cd-aef8-4069-b18a-18e875fa92fe)

## 2- Configuração do Ambiente Linux

Após o cadastro de usuário, conseguimos adentrar o ambiente e começar os trabalhos.
Mas antes disso, podemos verificar se estamos na versão mais atualizada do WSL, ja que muitas vezes acabamos baixando e instalando o WSL1, então seguiremos as seguintes etapas para verificação e atualização da ferramenta.

Deve-se abrir o PowerShell e utilizar o comando:

```
wsl --list --verbose
```
![wslversion](https://github.com/user-attachments/assets/ab566da7-eff7-49f5-8202-8d231985372d)

Com isso, verificamos a versão da distro, se ela estiver em 1, pegamos o name dela, nesse caso é o Ubuntu-20.04 e utilizamos o seguinte comando para setar o upgrade:
```
wsl --set-version Ubuntu-20.04 2
```
Com essa atualização, é possível utilizar recursos como o systemctl que nos auxilia muito em diversas aplicações no ambiente.

Agora utiliza-se o comando:
```
sudo su
```
Para o usuário ter os privilégios de super user e também ter acesso ao root.

## 3- Nginx

Para instalar o Nginx é necessário digitar o seguinte comando:
```
apt-get install nginx
```

Após a instalação, podemos verificar se ele está funcionando corretamente:

![image](https://github.com/user-attachments/assets/9d8ecf0c-6ed0-4878-b91e-101ebda22b46)

![image](https://github.com/user-attachments/assets/20f8186c-2dca-4981-bbf0-9f1a66b246e6)

Partindo para a parte de configuração do Nginx, é importante conferir se o seu arquivo está devidamente configurado de acordo com a porta correta, pasta raíz dos arquivos e ordem de leitura.
Para isso é necessário entrar no arquivo /etc/nginx/sites-enabled/default e conferir todas essas informações.

![confignginx](https://github.com/user-attachments/assets/dac6d2cd-dc4c-430a-9c9f-54a1f15c34be)

Nela conferimos o diretório padrão para arquivos como html, mas para a criação de um script não é necessário, nesse caso podemos incluir em qualquer pasta como /home/usuario/scripts.

## 4- Script em Shell script

Para criar o script, deve-se designar o diretório, e então dentro dele o script:
```
mkdir /home/usuario/script
nano nginxScript.sh
```
Com a ajuda do editor nano, foi possível estruturar o código de acordo com o projeto estipulado. Com isso foi desenvolvido o código para subir um servidor Nginx que valide se o serviço está online ou offline, 
com uma execução automatizada a cada 5 minutos, gerando dois arquivos de saída, um para o online e outro para o offline.

![image](https://github.com/user-attachments/assets/3c165235-cc32-4c0a-8bad-94baca317036)


#!/bin/bash - necessita-se começar o script dessa forma para indicar que é um script bash, sendo executado com o bash como interpretador padrão de linha de comando, ocasionando na prevenção de erros dependendo do shell utilizado.

LOGFILE_ON="/home/vitor/logs/nginx_on.log" - define o local do arquivo que receberá as informações do servidor em modo online.

LOGFILE_OFF="/home/vitor/logs/nginx_on.log" - define o local do arquivo que receberá as informações do servidor em modo offline.

data_hora=$(date +"Data: %d/%m/%Y Hora: %H:%M:%S") - variável que contém as informações 'real time' de dia e hora.

status=$(systemctl is-active nginx 2>&1) - variável que informa se o nginx está active ou inactive, retornando nulo para não mostrar a mensagem no terminal.

if [ "$status" == "inactive" ]; then - condicional se a variável status retornar inactive, então a variável STATUS se torna offline e a variável CURRENT_LOG se torna a variável LOGFILE_OFF.
    STATUS=offline
    CURRENT_LOG=$LOGFILE_OFF

else                                 - senão, a variável STATUS se torna online e a variável CURRENT_LOG se torna a variável LOGFILE_ON.
    STATUS=online
    CURRENT_LOG=$LOGFILE_ON

fi - fim do bloco da condicional

echo "$data_hora" >> $CURRENT_LOG - retorna a variável data_hora para o arquivo log online ou offline, dependendo da condição estabelecida.
echo "Serviço: Nginx" >> $CURRENT_LOG - retorna a string para o arquivo log.
echo "Status: $status" >> $CURRENT_LOG - retorna a string Status: com a variável status (active ou inactive) para o log.
echo "O serviço está $STATUS no momento" >> $CURRENT_LOG - retorna a string com a variável informando se o serviço está online ou offline.



    

