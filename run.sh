container_source=bilgrami/starter-flutter:v1
container_name=my_flutter_web
ARG_DROP_CONTAINER=${1:-0}
if [ $ARG_DROP_CONTAINER -eq 1 ]; then
    echo "stopping and removing ${container_name} container"
    docker stop ${container_name} || true && docker rm ${container_name} || true
fi
docker run --name ${container_name} -i -p 8080:5000 -td ${container_source}
if [ $? -eq 0 ]; then
    echo "Success. Please visit your website at http://localhost:8080 "
else
    echo "FAILED in starting your weebsite. Please see the error above. Exiting!"
fi

