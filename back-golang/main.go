package main

import (
	user "back-golang/controllers/user"
	"log"
	"net/http"
	"github.com/gorilla/mux"
)

func main() {

	r := mux.NewRouter()
	r.HandleFunc("/createUser", user.CreateUser).Methods("POST")
	r.HandleFunc("/login", user.Login).Methods("POST")

	log.Fatal(http.ListenAndServe(":8000", r))
}
