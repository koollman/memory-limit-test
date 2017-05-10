#!/bin/sh


runtest() {
    for i in $(seq 100 20 500); do
	docker run -m 300m python:3-alpine python -c "'a'*${i}*1024*1024" 2>/dev/null && echo -ne " $i" || echo "exit status for $i $?"
done
}

runtest

#activate overcommit. ratio first or we may be out of ressources
echo 95 > /proc/sys/vm/overcommit_ratio
echo 2 > /proc/sys/vm/overcommit_memory

runtest
