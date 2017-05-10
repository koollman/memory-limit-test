#!/bin/sh


for i in $(seq 100 10 500); do
    docker run -m 300m python:3-alpine python -c "'a'*${i}*1024*1024" && echo -ne "\r $i" || echo "exit status for $i $?"
done
