package main

import (
	"fmt"
	"net/http"
	"os"
	"strings"
	"time"
)

const port = ":9999"

func sayHello(res http.ResponseWriter, req *http.Request) {
	//loc, _ := time.LoadLocation("Asia/Shanghai") // "America/New_York"
	//cur := time.Now().In(loc).Format(time.RFC3339)
	cur := time.Now().Format(time.RFC3339)

	hostname, err := os.Hostname()
	if err != nil {
		hostname = "Unknown"
	}

	msg := req.URL.Path
	msg = strings.TrimPrefix(msg, "/")
	msg = cur + " : " + msg + " from " + hostname + ". By Bruce using Go lang. v10"

	fmt.Println(msg)

	res.Write([]byte(msg))
}

func main() {
	http.HandleFunc("/", sayHello)
	fmt.Println("Listening on " + port)
	if err := http.ListenAndServe(port, nil); err != nil {
		panic(err)
	}

}
