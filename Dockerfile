FROM golang:1.21 as build
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o desafio2

FROM scratch
WORKDIR /app
COPY --from=build /app/desafio2 .
ENTRYPOINT ["./desafio2"]