echo "Allocating additional 10GB of swap memory"
sudo fallocate -l 10GB /mnt/10GB.swap
sudo chmod 600 /mnt/10GB.swap
sudo mkswap /mnt/10GB.swap

echo "/mnt/10GB.swap swap swap defaults 0 0" | sudo tee -a /etc/fstab

echo "Adding nvidia as default container runtime for building containers"
sudo apt-get install -y jq
jq '.["default-runtime"] = "nvidia"' /etc/docker/daemon.json > tmp.$$.json && sudo mv -f tmp.$$.json /etc/docker/daemon.json
rm tmp.*.json

echo "Fix GPG commit signing by executing: 'export GPG_TTY=$(tty)'"

echo "Initialization process finished, please restart the machine"

