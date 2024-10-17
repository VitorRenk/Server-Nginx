
# Ferramenta WSL e Servidor Nginx

## 1- Instalação do Ubuntu e WSL

### WSL é uma ferramenta do Windows que permite executar binários e scripts do Linux, facilitando a integração entre os dois sistemas operacionais e tornando o desenvolvimento e a administração de sistemas mais ágeis e eficientes.

Primeiramente devemos ativar alguns recursos do Windows para que tudo funcione corretamente:
#### Menu Iniciar - Ativar ou desativar recursos do Windows.
#### Ativar os seguintes recursos: Plataforma de máquina virtual, Plataforma de hipervisor do Windows, Subsistema de Windows para Linux.

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








