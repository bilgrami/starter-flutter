container_source=bilgrami/starter-flutter:v1
container_name=starter_flutter_web
ARG_DROP_CONTAINER=${1:-0}
if [ $ARG_DROP_CONTAINER -eq 1 ]; then
    echo "stopping and removing ${container_name} container"
    docker stop ${container_name} || true && docker rm ${container_name} || true
fi
# docker run --name ${container_name} -i -p 8090:5000 -td ${container_source}
echo running ${container_name}
docker run --name ${container_name} -td --rm \
    -p 8090:5000 \
    -v ${container_name}:/flutter/lib \
    ${container_source}

if [ $? -eq 0 ]; then
    echo "Success. Please visit your website at http://localhost:8090 "
else
    echo "FAILED in starting your weebsite. Please see the error above. Exiting!"
fi

