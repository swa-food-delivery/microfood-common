#!/bin/bash
dockerfiles=("microfood/gateway:../gateway"
             "microfood/orders-service:../order-service/orders"
             "microfood/eureka:../eureka-server")

for dockerfile in "${dockerfiles[@]}" ; do
    image_name="${dockerfile%%:*}"
    image_location="${dockerfile##*:}"
    echo "Building ${image_name} image"
    (cd "${image_location}"; mvn clean install)
    docker build -t "${image_name}" "${image_location}"
done