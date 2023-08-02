FROM debian:bookworm-slim as build

RUN apt update
RUN apt install -y doxygen graphviz make git
COPY . /src
WORKDIR /src
RUN make

FROM nginx:mainline-alpine-slim
COPY --from=build /src/build/engine/generated_docs/html /usr/share/nginx/html
