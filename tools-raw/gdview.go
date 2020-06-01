// Diminuitive WebView viewr for {httpgd}
//
// @author boB Rudis <bob@rud.is>
// @license MIT
package main

import (
	"os"
	"strconv"
	"github.com/zserge/webview"
)

func main() {

	args := os.Args[1:]

	if len(args) == 3 {

    // passed in from [grandview::hgd()]

		httpgdURL := args[0]
		width, _ := strconv.Atoi(args[1])
		height, _ := strconv.Atoi(args[2])

		w := webview.New(true)

		defer w.Destroy()

		w.Bind("quit", func() {
		  w.Terminate()
		}

		w.SetTitle("httpgd : " + httpgdURL)

		w.SetSize(width, height, webview.HintNone)

		w.Navigate(httpgdURL)

		w.Run()

	}

}
