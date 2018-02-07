PROCESS_NAME=$1
docker images | grep $PROCESS_NAME | awk '{ print $3 }' | xargs -I {} docker rmi -f {}
