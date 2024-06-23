FROM gcc:14.1.0 as build

RUN apt update -y
RUN apt install -y doxygen graphviz make git
COPY . /src
WORKDIR /src
RUN make

FROM nginx:mainline-alpine-slim
COPY --from=build /src/build/engine/generated_docs/html /usr/share/nginx/html
