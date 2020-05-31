.PHONY:	macos linux win

macos:
	env GOOS=darwin GOARCH=amd64 CGO_ENABLED=1 go get github.com/zserge/webview
	rm -f ./products/macos/GrandView.app/Contents/MacOS/GrandView
	env GOOS=darwin GOARCH=amd64 CGO_ENABLED=1 go build -v -o ./products/macos/GrandView.app/Contents/MacOS/GrandView
	rm -rf ./products/macos/GrandView.app/Contents/_CodeSignature
	codesign --force -s "Developer ID Application: Bob Rudis (CBY22P58G8)" ./products/macos/GrandView.app
	rm -f ./products/macos/GrandView.app.zip
	cd ./products/macos && zip -r -X GrandView.app.zip GrandView.app && cd ../..

linux:
	# sudo apt install gtk+-3.0 webkit2gtk-4.0
	env GOOS=linux GOARCH=amd64 CGO_ENABLED=1 go get github.com/zserge/webview
	env GOOS=linux GOARCH=amd64 CGO_ENABLED=1 go build -v -o products/linux/grandview

win:
	env GOOS=windows GOARCH=amd64 CGO_ENABLED=1 go get github.com/zserge/webview
	env GOOS=windows GOARCH=amd64 CGO_ENABLED=1 go build -ldflags="-H windowsgui" -v -o products/windows/GrandGiew.exe