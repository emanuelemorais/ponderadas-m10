package user

import (
	"fmt"
    models "back-golang/models"
	_ "github.com/lib/pq"
    
)


func NewUser(name string, email string, password string) {
	db := models.ConnectDb()

	stmt, err := db.Prepare("INSERT INTO users(name, email, password) VALUES($1, $2, $3)")
	if err != nil {
		panic(err)
	}
	defer stmt.Close()

	_, err = stmt.Exec(name, email, password)
	if err != nil {
		panic(err)
	}

	fmt.Println("Dados inseridos com sucesso!")
	db.Close()
}


func Login(email string, password string) string {
    db := models.ConnectDb()

    stmt, err := db.Prepare("SELECT * FROM users WHERE email = $1 AND password = $2")
    if err != nil {
        panic(err)
    }
    defer stmt.Close()

    _, err = stmt.Exec(email, password)
    if err != nil {
        panic(err)
    }

    tokenString, err := models.CreateToken(email)

    fmt.Println("Login realizado com sucesso!")
    db.Close()

    return tokenString
}

