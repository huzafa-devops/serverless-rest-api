build:
	env GOARCH=amd64 GOOS=linux go build -ldflags="-s -w" -o bin/main main.go
deploy_dev: build
	serverless deploy --stage dev --aws-profile default