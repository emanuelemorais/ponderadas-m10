package user

import (
	models "back-golang/models"
	taskModel "back-golang/models/task"
	"encoding/json"
	"net/http"

	"github.com/gorilla/mux"
)

type Task struct {
	ID          string `json:"id"`
	UserID      string `json:"name"`
	Title       string `json:"title"`
	Description string `json:"description"`
}

func GetTasksById(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	tokenString := r.Header.Get("Authorization")
	if tokenString == "" {
		w.WriteHeader(http.StatusUnauthorized)
		json.NewEncoder(w).Encode("Missing authorization header")
		return
	}

	tokenString = tokenString[len("Bearer "):]

	errToken := models.VerifyToken((tokenString))
	if errToken != nil {
		w.WriteHeader(http.StatusUnauthorized)
		json.NewEncoder(w).Encode("Invalid token")
		return
	}

	params := mux.Vars(r)

	tasks, err := taskModel.GetAllTasksById(params["userID"])
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		message := "Erro ao buscar tarefas."
		w.Write([]byte(message))
		return
	}
	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(tasks)
}

func CreateTask(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	tokenString := r.Header.Get("Authorization")
	if tokenString == "" {
		w.WriteHeader(http.StatusUnauthorized)
		json.NewEncoder(w).Encode("Missing authorization header")
		return
	}

	tokenString = tokenString[len("Bearer "):]

	errToken := models.VerifyToken((tokenString))
	if errToken != nil {
		w.WriteHeader(http.StatusUnauthorized)
		json.NewEncoder(w).Encode("Invalid token")
		return
	}

	params := mux.Vars(r)

	var task Task
	_ = json.NewDecoder(r.Body).Decode(&task)

	err := taskModel.NewTask(params["userID"], task.Title, task.Description)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		message := "Erro ao criar tarefa."
		w.Write([]byte(message))
		return
	}
	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode("Tarefa criada com sucesso!")
}

func EditTask(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	tokenString := r.Header.Get("Authorization")
	if tokenString == "" {
		w.WriteHeader(http.StatusUnauthorized)
		json.NewEncoder(w).Encode("Missing authorization header")
		return
	}

	tokenString = tokenString[len("Bearer "):]

	errToken := models.VerifyToken((tokenString))
	if errToken != nil {
		w.WriteHeader(http.StatusUnauthorized)
		json.NewEncoder(w).Encode("Invalid token")
		return
	}

	var task Task
	_ = json.NewDecoder(r.Body).Decode(&task)

	err := taskModel.EditTask(task.ID, task.Title, task.Description)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		message := "Erro ao editar tarefa."
		w.Write([]byte(message))
		return
	}
	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode("Tarefa editada com sucesso!")
}

func DeleteTask(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	tokenString := r.Header.Get("Authorization")
	if tokenString == "" {
		w.WriteHeader(http.StatusUnauthorized)
		json.NewEncoder(w).Encode("Missing authorization header")
		return
	}

	tokenString = tokenString[len("Bearer "):]

	errToken := models.VerifyToken((tokenString))
	if errToken != nil {
		w.WriteHeader(http.StatusUnauthorized)
		json.NewEncoder(w).Encode("Invalid token")
		return
	}

	var task Task
	_ = json.NewDecoder(r.Body).Decode(&task)

	err := taskModel.DeleteTask(task.ID)
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		message := "Erro ao deletar tarefa."
		w.Write([]byte(message))
		return
	}
	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode("Tarefa deletada com sucesso!")
}