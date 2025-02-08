// First Go program
package main

import (
	"fmt"

	"rsc.io/quote/v4"
)

// Explicit typing of the variable as a string, and assigning an initial value
// var userName string = "Dave"
var userName string

// Main function
func main() {
	GetUser()

	switch userName {
	case "Dave", "David":
		userName = "God"
		fmt.Printf("!... Hello %v ...!\n", userName) // Variable substitution with printf
	case "":
		fmt.Printf("No name was entered...\n")
	default:
		fmt.Printf("!... Hello %v ...!\n", userName) // Variable substitution with printf
	}
	if userName != "" {
		fmt.Println(quote.Go()) // Print with newline via Println
	} else {
	}
}

func GetUser() {
	fmt.Print("Please enter your user name: ")
	fmt.Scanln(&userName)
}
