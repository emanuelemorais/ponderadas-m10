# TO-DO Tasks: API Async Golang

## Como rodar utilizando o docker

> IMPORTANTE: Para rodar a API é necessário ter docker configurado na máquina!

1. Dentro do diretório `ponderada-m10/back-golang` crie um arquivo `.env` com as sequintes informações:

```
POSTGRES_DB= <seu-banco-de-dados>
POSTGRES_USER= <seu-user>
POSTGRES_PASSWORD= <sua-senha>
```
2. No mesmo diretório rode o comando abaixo:

```
docker compose --env-file ./.env up
```

## Enpoints criados

| Tipo de Requisição | Endpoint              | Descrição                 |
|--------------------|-----------------------|---------------------------|
| POST               | /createUser           | Criar um novo usuário     |
| POST               | /login                | Fazer login               |
| GET                | /getTasks/{userID}    | Obter tarefas por ID      |
| POST               | /createTask/{userID}  | Criar uma nova tarefa     |
| PUT                | /editTask             | Editar uma tarefa         |
| DELETE             | /deleteTask           | Excluir uma tarefa        |


## Teste da aplicação utilizando o Insomnia

Acesse o teste em https://drive.google.com/file/d/18-0G7SHS-jpL8qcevDN5UJemWaUBNOqA/view?usp=sharing

## Estrutura dos arquivos

```
back-golang
├── controllers
│   ├── task
│   │   └── task.go
│   └── user
│   │   └── user.go
├── models
│   ├── migrations
│   │   └── tables.sql
│   ├── user
│   │   └── user.go
│   ├── task
│   │   └── task.go
│   └── models.go
├── static
│   └── insomnia_go.json
├── compose.yaml
├── Dockerfile
├── main.py
├── go.mod
├── go.sum
├── README.md

```

### Descrição dos arquivos

- `controllers` : Possuem funções intermediárias entre as requisições feitas e a manipulação do banco de dados. Os controllers foram divididos em task, que possui funções de manipulação das tarefas e user, que possui funções relacionadas aos usuários.
- `models`: Dentro de models existem os arquivos reponsáveis pela manipulação direta do banco de dados, sendo eles dividos na mesma lógica dos controllers, entre user e task. Além disso, nessa pasta existe um subpasta chamada migrations que possui o SQL utilizado para a criação das tabelas no banco de dados. Por fim, também existe um arquivo models.go que possui funções auxiliares de comunicação com banco de dados e criação de tokens JWT.
- `static`: Possui a collection criada validação da API pelo Insomnia.
- `Dockerfile` e `compose.yaml`: O `Dockerfile` cria a imagem da API e o `compose.yaml` orquestra a imagem da API e de um postgress em containers.
- `main.go`: Ponto de início da API. Possui a definição das rotas criadas.
- `go.mod`e `go.sum`:  Arquivos de configuração do ambiente de um projeto Golang.