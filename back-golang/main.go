package main

import (
	user "back-golang/controllers/user"
	task "back-golang/controllers/task"
	"log"
	"net/http"
	"github.com/gorilla/mux"
)

func main() {

	r := mux.NewRouter()
	r.HandleFunc("/createUser", user.CreateUser).Methods("POST")
	r.HandleFunc("/login", user.Login).Methods("POST")
	r.HandleFunc("/getTasks/{userID}", task.GetTasksById).Methods("GET")
	r.HandleFunc("/createTask/{userID}", task.CreateTask).Methods("POST")
	r.HandleFunc("/editTask", task.EditTask).Methods("PUT")
	r.HandleFunc("/deleteTask", task.DeleteTask).Methods("DELETE")
	
	log.Fatal(http.ListenAndServe(":8000", r))
}
