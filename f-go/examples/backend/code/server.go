package main

import (
	"io"
	"net/http"
)

var httpPort = ":30080"

func main() {
	http.HandleFunc("/", onDefault)
	http.ListenAndServe(httpPort, nil)
}

func onDefault(w http.ResponseWriter, r *http.Request) {
	io.WriteString(w, "BE Hello world!")
}
