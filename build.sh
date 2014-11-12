declare IMAGE=$(docker build . | awk '/--> ([a-f0-9]*)$/ { print $2 }' | tail -1)
docker tag $IMAGE factor/cloud
docker push factor/cloud