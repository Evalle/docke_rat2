#!/usr/bin/env bats
# Install BATS on your system first https://github.com/sstephenson/bats

load settings

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

@test "Check docker version" {
    run docker --version 
    [ $output = "Docker version 1.6.2, build 7c8fca2" ]
}

@test "Check list of running docker containers " {
    run sudo docker ps
    [ $status = 0 ]
}

@test "Check that we can run ubuntu container with 'uname -r' command" {
    run bash -c "sudo docker run ubuntu uname -r"
    [ $status = 0 ]
}

@test "Check that we can run ubuntu container with echo 'Hello world' command" {
    run bash -c "sudo docker run ubuntu echo 'Hello world!'"
    [ $status = 0 ]
}

@test "Check that we can run ubuntu container with 'df -h' command" {
    run bash -c "sudo docker run ubuntu df -h"
    [ $status = 0 ]
}

@test "Check that we can run ubuntu contatiner with 'mount' command" {
    run bash -c "sudo docker run ubuntu mount"
    [ $status = 0 ]
}

@test "Check that we can run docker ps -a command" {
    run docker ps -a 
    [ $status = 0 ]
}
