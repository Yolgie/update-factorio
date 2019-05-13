#!/bin/bash

echo "Stopping Factorio..."
sudo systemctl stop factorio
echo "Downloading latest version..."
cd /home/yolgie/update-factorio/
mkdir -p downloadedFiles
cd downloadedFiles
wget -q --show-progress https://www.factorio.com/get-download/latest/headless/linux64
echo "Extracting and Installing..."
tar xf linux64 && rsync -a factorio/ /opt/factorio/
echo "Starting Factorio..."
sudo systemctl start factorio
sleep 2
echo "Removing downloaded files"
cd ..
rm -rf downloadedFiles
echo "Update to version $(head -n 1 /opt/factorio/factorio-current.log | awk '{print $5}') finished"
echo "Updated to version $(head -n 1 /opt/factorio/factorio-current.log | awk '{print $5}') on $(date)" >> update-factorio.log
