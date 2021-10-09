cd loadbalancer
docker stop loadbalancer
docker rmi lb_image
docker build -t lb_image:latest .
docker run --rm -dti --name loadbalancer -p 8888:8080 lb_image