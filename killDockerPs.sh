PROCESS_NAME=$1

docker ps | grep $PROCESS_NAME | awk '{ print $1 }' | xargs -I {} docker rm -f {}

