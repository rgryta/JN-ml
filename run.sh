sudo docker run -it --rm --runtime nvidia --network host --volume ~/nvidia:/home/nvidia --volume /tmp/argus_socket:/tmp/argus_socket --device /dev/video0 --memory=500M --memory-swap=10G rgryta/dli-jetcam:latest

