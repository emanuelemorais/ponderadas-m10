FROM golang:latest

WORKDIR /app

COPY . .

RUN go mod tidy

EXPOSE 8000

CMD ["go", "run", "main.go"]
