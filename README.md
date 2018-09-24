CI-ROBOTICS
============================

# Guide

## Requirement
1. Install docker in all nodes.
2. Give root access to docker(https://docs.docker.com/install/linux/linux-postinstall/#manage-docker-as-a-non-root-user).
3. Install docker-composer in Master node.

## Master computer
The following is only run **once** in your master comuter.

1. **Fork** this repo to your github account and then git clone from **your repo** to local(because you will push some necessary information to your repo for node in next steps).
1. Run `cd ciRobotics`
1. Run `. masterStart.sh` to init a swarm and create a gitlab server.
1. Wait two minutes to start a gitlab server. Go to `localhost:7001` to check whether the gitlab is ready.
1. If it is ready, the page will ask you to set a password. Set any password you want. Then you will have a root accout with username `root` and password you have just seted.
1. Go to `Admin/runner/shared runner` to copy the shared runner token.
1. Paste the runner token in file `sharedrunnertoken.txt`
1. Run `. runnerReg.sh` to register a shared runner for the gitlab.
1. Run `. masterService.sh` to start a swarm service. Here, some info abot master computer will be pushed to github under your account.
1. RUN `sudo ./enjoy.sh`. This step need a sudo privilege becasue it will add a domain name in your `/etc/hosts` and modify `/etc/docker/daemon.json` to use registry in an easy way(insecure).

## Worker computers
1. git clone **your repo** in local. Careful, not `MISTLab/ciRobotics`
2. Run `cd ciRobotics`
3. RUN `sudo ./enjoy.sh`. This step need a sudo privilege becasue it will add a domain name in your `/etc/hosts` and modify `/etc/docker/daemon.json` to use registry in an easy way(insecure).

## Example use case
After setup the *Master computer* and *Worker computers* successfully, then it will be easy to use it in any of your projects. 
1. Go to your github project folder.
1. Run `git remote add *your_local_gitlab_project_address*`
1. Run `git remote set-url --add --push origin *your_local_gitlab_project_address*`
1. Run `git remote show origin` to check whether you have both push address.
1. Add `.gitlab-ci.yml` and `Dockerfile` and enjoy the continuous intergration of robotics software.
