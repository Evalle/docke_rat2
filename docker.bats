#!/usr/bin/env bats
# You can find BATS here https://github.com/sstephenson/bats

@test "Check that Docker is running on our system " {
    run sudo systemctl status docker
    [ $status = 0 ]
}

@test "check that we can stop Docker on our system " {
    run sudo systemctl stop docker 
    [ $status = 0 ]
} 

@test "check that we can start Docker on our system " {
    run sudo systemctl start docker 
    [ $status = 0 ]
}

@test "Check that Docker is running on our system " {
    run sudo systemctl status docker 
    [ $status = 0 ]
}

@test "Check that we can restart Docker on our system " {
    run sudo systemctl restart docker 
    [ $status = 0 ]
}

# Skip because you need to know exactly version of Docker. Comment a line below to run this test after you change settings.bash with exactly version of Docker
@test "Check docker version" {
    skip "You need to know exactly version of Docker - you can change it in settings.bash"
    run docker --version 
    [ $output = $VERSION ]
}

@test "Check list of running docker containers " {
    run sudo docker ps
    [ $status = 0 ]
}

@test "Check that we can start a new container via 'docker run uname -r'" {
    run bash -c "sudo docker run ubuntu uname -r"
    [ $status = 0 ]
}

@test "Check that we can start new container via 'docker run ubuntu echo 'Hello world'" {
    run bash -c "sudo docker run ubuntu echo 'Hello world!'"
    [ $status = 0 ]
}

@test "Check that we can start new container via 'docker run ubuntu df -h" {
    run bash -c "sudo docker run ubuntu df -h"
    [ $status = 0 ]
}

@test "Check that we can start new container via 'docker run ubuntu mount" {
    run bash -c "sudo docker run ubuntu mount"
    [ $status = 0 ]
}

@test "Check that we can list all docker containers via 'docker ps -a' command" {
    run docker ps -a 
    [ $status = 0 ]
}

@test "Check that we can list all docker images via 'docker images' command" {
    run docker images
    [ $status = 0 ]
}

@test "Check that we can run 'docker info' command" {
    run docker info
    [ $status = 0 ]
}


