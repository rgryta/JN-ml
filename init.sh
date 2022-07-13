echo "Allocating additional 10GB of swap memory"
sudo fallocate -l 10GB /mnt/10GB.swap
sudo chmod 600 /mnt/10GB.swap
sudo mkswap /mnt/10GB.swap

sudo su
echo "/mnt/10GB.swap swap swap defaults 0 0" >> /etc/fstab
exit


echo "Adding nvidia as default container runtime for building containers"
jq '.["default-runtime"] = "nvidia"' /etc/docker/daemon.json > tmp.$$.json && mv tmp.$$.json /etc/docker/daemon.json


echo "Initialization process finished, please restart the machine"

