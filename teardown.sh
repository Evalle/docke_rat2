#!/bin/sh
echo "Do you wish to destory all Docker images and containers on your system? (Please choose  1 - for Yes, and 2 - for No)"
select yn in "Yes" "No"; do
    case $yn in 
        Yes ) docker rm -f $(docker ps -a -q) && docker rmi $(docker images -q) > /dev/null; break;;
        No  ) exit;;
    esac
done

