# Stop all docker and remove images

docker stop $(docker ps -a -q)
docker rm -f $(docker ps -a -q)
docker rmi  -f $(docker images -q)




docker-compose up --build


##






