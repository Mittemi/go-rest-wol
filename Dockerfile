
# Build Stage
FROM arm32v7/golang:alpine AS builder

# Install Dependecies
RUN apk add git
RUN go get -d github.com/gorilla/handlers
RUN go get -d github.com/gorilla/mux
RUN go get -d github.com/gocarina/gocsv

# Copy all Source Files
#WORKDIR /go/src/app
COPY . .

# Build it
RUN go build -o /build/go-rest-wol

# Copy Required Files into build Directory
WORKDIR /build
COPY /pages/* ./pages/
ADD VERSION .

# Final Image Stage
FROM arm32v7/alpine 
WORKDIR /go
COPY --from=builder /build/ /go
COPY /config /config 

# Define Enviroment Vars
ENV WOLFILE="/config/computer.csv"

#ENTRYPOINT ls -la /; ls -la /config; cat /config/computer.csv 
ENTRYPOINT /go/go-rest-wol --file $WOLFILE 

EXPOSE 8080
