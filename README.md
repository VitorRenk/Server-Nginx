Etapas para Fazer Commit e Push no GitHub
1. Navegar até o diretório do repositório
Abra o terminal WSL e navegue até o diretório onde seu repositório está localizado:

bash
Copiar código
cd /caminho/para/seu/repositório
2. Verificar o status do repositório
Antes de fazer o commit, verifique se há alterações ou arquivos novos que precisam ser enviados:

bash
Copiar código
git status
3. Adicionar arquivos ao commit
Se houver arquivos não rastreados ou modificados, adicione-os ao staging area usando o seguinte comando:

bash
Copiar código
git add .
Isso adicionará todos os arquivos modificados. Você também pode adicionar arquivos individualmente:

bash
Copiar código
git add nome_do_arquivo
4. Criar um commit
Após adicionar os arquivos, você pode criar um commit com uma mensagem descritiva:

bash
Copiar código
git commit -m "Descrição do commit"
Por exemplo:

bash
Copiar código
git commit -m "Adiciona script de monitoramento para o Nginx"
5. Sincronizar com o repositório remoto
Antes de fazer o push, é uma boa prática trazer as alterações do repositório remoto para evitar conflitos. Use o comando:

bash
Copiar código
git pull origin main --rebase
Este comando trará as alterações do repositório remoto e aplicará suas alterações por cima.

6. Fazer o push das alterações
Agora que o repositório local está sincronizado, você pode enviar as alterações para o GitHub:

bash
Copiar código
git push origin main
Isso enviará suas alterações para a branch main do repositório remoto.

7. Excluir branches locais desnecessárias (opcional)
Caso queira excluir uma branch local que não seja mais necessária, use o seguinte comando:

bash
Copiar código
git branch -d nome_da_branch
Se precisar excluir a branch remota, use:

bash
Copiar código
git push origin --delete nome_da_branch
Exemplo Real
A imagem abaixo mostra um exemplo real do processo descrito acima:


No exemplo:

O pull com rebase foi feito para garantir que as alterações remotas estão sincronizadas.
Após o pull, o push foi executado para enviar as alterações para o repositório remoto.
A branch master foi excluída, pois já não era mais necessária.
