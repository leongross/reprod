package main

/*
#include <uuid/uuid.h>
#cgo LDFLAGS: -luuid
*/
import "C"

import "fmt"

func uuid_generate() {
	var uuid C.uuid_t
	C.uuid_generate(&uuid[0])
	fmt.Printf("uuid = %v\n", uuid)
}

func main() {
	fmt.Println("Reproduce me")
	uuid_generate()
}
