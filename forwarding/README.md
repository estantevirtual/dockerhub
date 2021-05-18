# Forwarding

Essa imagem providencia uma maneira simples de configurar o redirecionamento de portas através de SSH.

## Variáveis de Ambiente

Para funcionar corretamente, a imagem depende de 4 variáveis de ambiente:

- FWD_SERVER
- FWD_USER
- FWD_RSA
- FWD_LIST

### FWD_SERVER

O servidor que será a base para o redirecionamento das portas.

### FWD_USER

O usuário que tem permissão para acessar o servidor configurado em `FWD_SERVER`.

### FWD_RSA

O conteúdo da chave RSA privada, que será utilizada na autenticação com o `FWD_SERVER` utilizando o usuário `FWD_USER`.

### FWD_LIST

Uma lista de redirecionamentos, cujo os itens são separados por `,`. Por exemplo:

`FWD_LIST=3306:my_mysql_server:3306,5432:my_postgres_server:5432`

Por favor, visite
[o código fonte no github](https://github.com/estantevirtual/dockerhub/blob/master/forwarding/Dockerfile)
para mais detalhes.
