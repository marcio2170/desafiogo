##### Stage 1 #####

### Use golang:1.18 as base image for building the application
FROM golang:1.18 as builder

### Create new directly and set it as working directory
RUN mkdir -p /app

WORKDIR /app

### Copy Go application dependency files
COPY main.go .

RUN go build main.go

##### Stage 2 #####

### Define the running image

FROM scratch

### Set working directory
WORKDIR /app

### Copy built binary application from 'builder' image
COPY --from=builder /app .

### Run the binary application
CMD ["./main"]