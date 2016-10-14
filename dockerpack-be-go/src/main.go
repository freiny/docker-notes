package main

import (
	"fmt"

	"github.com/gin-gonic/gin"
)

func main() {
	router := gin.Default()
	router.GET("/users", onUsers)
	router.Run(":8080")
}

func onUsers(c *gin.Context) {
	fmt.Println("jan bob pat")
}
