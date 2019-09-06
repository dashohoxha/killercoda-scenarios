#sleep 1; ./progress.sh
echo "Waiting for DVC to be installed..."; while [ ! -f /var/.dvc-installed ] ; do sleep 2; done; echo "Done"
