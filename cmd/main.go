package main

// #include "HelloWorld.h"
import "C"

import "fmt"

func main() {
	fmt.Println("Hello, World from Golang!")
	helloWorld()
}

func helloWorld() {
	ptr := C.hello_world()
	fmt.Println(C.GoString(ptr))
}
