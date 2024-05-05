package main

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/lib/pq"
	"os"
	"github.com/joho/godotenv"
)

func main() {

	err := godotenv.Load("../../.env")
    if err != nil {
        log.Fatalf("Erro ao carregar o arquivo .env: %v", err)
    }

    dbUser := os.Getenv("POSTGRES_USER")
    dbPassword := os.Getenv("POSTGRES_PASSWORD")
    dbName := os.Getenv("POSTGRES_DB")

	connectionString := fmt.Sprintf("postgres://%s:%s@localhost:5432/%s?sslmode=disable", dbUser, dbPassword, dbName,)
	db, err := sql.Open("postgres", connectionString)
	if err != nil {
		log.Fatalf("Erro ao abrir conexão com o banco de dados: %v", err)
	}
	defer db.Close()

	_, err = db.Exec(`CREATE TABLE IF NOT EXISTS users (
		id SERIAL PRIMARY KEY,
		name VARCHAR(255),
		email VARCHAR(255),
		password VARCHAR(255)
	)`)
	if err != nil {
		log.Fatalf("Erro ao criar a tabela: %v", err)
	}

	_, err = db.Exec(`CREATE TABLE IF NOT EXISTS tasks (
		id SERIAL PRIMARY KEY,
		user_id INTEGER,
		title VARCHAR(255),
		description TEXT,
		FOREIGN KEY (user_id) REFERENCES users(id)
	)`)
	if err != nil {
		log.Fatalf("Erro ao criar a tabela: %v", err)
	}

	fmt.Println("Tabelas criada com sucesso!")
}
