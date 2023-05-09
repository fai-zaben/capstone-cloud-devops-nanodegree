docker tag flask-app satrcodes/flask-app:1.0
docker tag flask-app satrcodes/flask-app:lastest

# Login to docker-hub
docker login 

# Push image
docker push satrcodes/flask-app:1.0
docker push satrcodes/flask-app:lastest