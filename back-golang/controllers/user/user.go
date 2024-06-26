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

// CreateUser cria um novo usuário
// @Summary Cria um novo usuário
// @Description Cria um novo usuário com os dados fornecidos
// @Accept json
// @Produce json
// @Param body body User true "Dados do novo usuário"
// @Success 201 {object} UserResponse
// @Router /createUser [post]
func CreateUser(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	var user User
	_ = json.NewDecoder(r.Body).Decode(&user)
	err := userModel.NewUser(user.Name, user.Email, user.Password)

	if err != nil {
        w.WriteHeader(http.StatusInternalServerError)
        message := "Erro ao cadastrar usuário. Email já cadastrado."
        w.Write([]byte(message))
        return
		
    } else {
		w.WriteHeader(http.StatusOK)
		message := "Usuario cadastrado com sucesso"
		w.Write([]byte(message))
		return
	}
}

func Login(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	var user User
	_ = json.NewDecoder(r.Body).Decode(&user)
	token, userID := userModel.Login(user.Email, user.Password)
	response := map[string]interface{}{
        "token": token,
        "userID": userID,
    }
	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(response)
}