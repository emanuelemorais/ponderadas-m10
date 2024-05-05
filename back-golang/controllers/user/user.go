package user

import (
	"encoding/json"
	"net/http"
	userModel "back-golang/models/user"
)

type User struct {
	ID     string  `json:"id"`
	Name   string  `json:"name"`
	Email  string  `json:"email"`
	Password string `json:"password"`
}

func CreateUser(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	var user User
	_ = json.NewDecoder(r.Body).Decode(&user)
	userModel.NewUser(user.Name, user.Email, user.Password)
	w.WriteHeader(http.StatusOK)
	message := "Usuario cadastrado com sucesso"
	w.Write([]byte(message))

}

func Login(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	var user User
	_ = json.NewDecoder(r.Body).Decode(&user)
	token := userModel.Login(user.Email, user.Password)
	w.WriteHeader(http.StatusOK)
	w.Write([]byte(token))
}