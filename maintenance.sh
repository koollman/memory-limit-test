#!/bin/sh


for i in $(seq 100 20 500); do
    docker run -m 300m python:3-alpine python -c "'a'*${i}*1024*1024" 2>/dev/null && echo -ne "\r $i" || echo "exit status for $i $?"
done

echo 2 > /proc/sys/vm/overcommit_memory

for i in $(seq 100 10 500); do
    docker run -m 300m python:3-alpine python -c "'a'*${i}*1024*1024" 2>/dev/null && echo -ne "\r $i" || echo "exit status for $i $?"
done
