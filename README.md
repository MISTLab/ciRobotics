CI-ROBOTICS
============================
**multiple repo to push**
- git remote add "address"
- git remote set-url --add --push origin "address"
- git remote show origin

#Guide

## Master computer
The following is only need to run **once** in your master comuter.

1. Fork this repo to your github account and then git clone to local.
1. Run `cd ciRobotics`
1. Run `. masterrun.sh` to init a swarm andd creat a gitlab servo.
1. Wait two minutes to start a gitlab server. Go to `localhost:7001` to check whether the gitlab is ready.
1. If it is ready, the page will ask you to set a password. Set any password you want. Then you will have a root accout with username `root` and password you have used.
1. Go to `Admin/runner/shared runner` to copy the shared runner token.
1. Paste the runner token in file `sharedrunnertoken.txt`
1. Run `. runnerReg.sh` to register a shared runner for the gitlab.
1. Run `. first.sh` to start a swarm service.
1. RUN `sudo ./second.sh`. This step need a sudo privilege becasue it will add a domain name in your `/etc/hosts` and modify `/etc/docker/daemon.json` to use registry in an easy way(insecure).

## Worker computers
1. git clone **your repo** in local. Careful, not `yanjundream/ciRobotics`
2. Run `cd ciRobotics`
3. RUN `sudo ./second.sh`. This step need a sudo privilege becasue it will add a domain name in your `/etc/hosts` and modify `/etc/docker/daemon.json` to use registry in an easy way(insecure).

