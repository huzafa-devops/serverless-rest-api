clean:
	go clean
	rm -r ./bin
build:
	env GOARCH=amd64 GOOS=linux go build -ldflags="-s -w" -o bin/main main.go
deploy_dev: build
	serverless deploy --stage dev --aws-profile default --verbose
remove:
	serverless remove --stage dev --aws-profile default --verbose

start:
	sls offline --useDocker start --host 0.0.0.0