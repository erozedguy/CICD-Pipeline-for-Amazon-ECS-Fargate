package main

import (
	"fmt"
	"log"
	"net"
	"net/http"
)

func main() {
	log.Print("HTTPserver: Enter main()")
	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe("0.0.0.0:5000", nil))
}

// printing request headers/params
func handler(w http.ResponseWriter, r *http.Request) {

	log.Print("request from address: %q\n", r.RemoteAddr)
	fmt.Fprintf(w, "%s %s %s\n", r.Method, r.URL, r.Proto)

	fmt.Fprintf(w, "Host = %q\n", r.Host)
	fmt.Fprintf(w, "RemoteAddr = %q\n", r.RemoteAddr)
	if err := r.ParseForm(); err != nil {
		log.Print(err)
	}
	for k, v := range r.Form {
		fmt.Fprintf(w, "Form[%q] = %q\n", k, v)
	}
	fmt.Fprintf(w, "\n===> local IP: %q\n\n", GetOutboundIP())
}

func GetOutboundIP() net.IP {
	conn, err := net.Dial("udp", "8.8.8.8:80")
	if err != nil {
		log.Fatal(err)
	}
	defer conn.Close()

	localAddr := conn.LocalAddr().(*net.UDPAddr)

	return localAddr.IP
}
