FROM alpine:latest as build

RUN apk update
RUN apk add doxygen graphviz make git
COPY . /src
WORKDIR /src
RUN make

FROM nginx:mainline-alpine-slim
COPY --from=build /src/build/engine/generated_docs/html /usr/share/nginx/html
