// First Go program
package main

import (
	"fmt"

	"rsc.io/quote/v4"
)

// Explicit typing of the variable as a string, and assigning an initial value
var userName string = "Dave"

// Main function
func main() {
	if userName == "Dave" {
		userName = "God"
		fmt.Printf("!... Hello %v ...!\n", userName) // Variable substitution with printf
	} else {
		fmt.Printf("!... Hello %v ...!\n", userName) // Variable substitution with printf
	}
	fmt.Println(quote.Go()) // Print with newline via Println
}
