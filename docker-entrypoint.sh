#!/bin/sh

(while true; do socat TCP-LISTEN:1729,fork TCP:host.docker.internal:1729; done) &
(while true; do socat UNIX-LISTEN:/tmp/secretive,reuseaddr,fork TCP-CONNECT:host.docker.internal:4242; done) &

SSH_AUTH_SOCK=/tmp/secretive

tmux new-session -A -s main
