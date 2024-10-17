
# 1- Ferramenta WSL

## 1.1- Instalação do Ubuntu e WSL

### WSL é uma ferramenta do Windows que permite executar binários e scripts do Linux, facilitando a integração entre os dois sistemas operacionais e tornando o desenvolvimento e a administração de sistemas mais ágeis e eficientes.

Primeiramente devemos ativar alguns recursos do Windows para que tudo funcione corretamente:
#### Menu Iniciar - Ativar ou desativar recursos do Windows.
#### Ativar os seguintes recursos: Plataforma de máquina virtual, Plataforma de hipervisor do Windows, Subsistema de Windows para Linux.

![features](https://github.com/user-attachments/assets/25e3bbd9-9ca0-4549-b6bd-92b373fe6f76)

Para conseguir utilizar o WSL, é necessário atualizar o kernel do Linux para WSL com o seguinte pacote:
https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi

Depois disso é necessário reiniciar a máquina para aplicar essas alterações.

Após isso, é importante atualizar o WSL caso ele não esteja, utilizando o PowerShell, com o seguinte comando:
```
wsl --update
```
A próxima etapa é ir até a Microsoft Store e baixar e instalar o Ubuntu 20.04.6 LTS ou qualquer outro acima da versão 20.04.

![ubuntu](https://github.com/user-attachments/assets/8a30dfb1-e13f-483d-a82f-895e161ccb8f)



