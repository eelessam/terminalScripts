PROCESS_NAME=$1

docker ps | grep $PROCESS_NAME | awk '{ print  }' | xargs -I {} docker rm -f {}

