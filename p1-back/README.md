# TO-DO Tasks: API Sync

## Como rodar o código localmente (sem docker)

Entre em `ponderadas-m10/p1-back-sync` e execute o seguinte comando para criar uma virtual environment:

```
python3 -m venv venv
```

Em seguida "ative" o ambiente com o seguinte comando:

```
source venv/bin/activate
```

Após isso, instale as bibliotecas necessarias:

```
pip install -r requirements.txt
```

Depois de realizados os passos acima, execute a API com o comando abaixo:
```
python3 main.py
```

Para acessar a documentação Swagger da API acesse http://127.0.0.1:3000/documentation/

## Como rodar utilizando o docker

Para rodar entre no diretório `ponderada-m10/p1-back-sync` e execute o comando abaixo:
```
docker compose up
```
Para acessar a documentação Swagger da API acesse http://127.0.0.1:3000/documentation/

## Teste da aplicação utilizando o Insomnia

Acesse o teste em https://drive.google.com/file/d/16_1xbvyspkD9j9IHTFXiM3RVaFPoJmxh/view?usp=sharing

## Estrutura dos arquivos

```
p1-back-sync
├── database
│   ├── create_tables.py
│   └── sqlite.db
├── static
│   ├── Insomnia_API.json
│   └── swagger.json
├── compose.yaml
├── Dockerfile
├── main.py
├── README.md
├── requirements.txt

```

### Descrição dos arquivos

- `database/create_tables.py`: Arquivo que foi executado para criação do banco de dados sqlite. Para executá-lo entre em seu diretório e rode o comando `python3 create_tables.py` no terminal (não é necessário pois o db já foi adicionado ao repositório).
- `database/sqlite.db`: Banco de dados criado para a salvar as informações. (Atenção: esse arquivo só foi commitado pois possui pouquissima informações armazenadas).
- `static/Insomnia_API.json`: Coleção de Insomnia para testar a API.
- `static/swagger.json`: Json responsável por gerar o Swagger para documentação da API.
- `Dockerfile`: Arquivo que contém as instruções que definem como construir uma imagem Docker.
- `compose.yaml`: Arquivo que orquestra os containers.
- `main.py`: Arquivo principal para execução da API.
- `README.md`: Este arquivo.
- `requirements.txt`: Bibliotecas necessárias para funcionamento do sistema.
