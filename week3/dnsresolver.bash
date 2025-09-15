
#!/bin/bash

networkprefix=$1
DNSserver=$2
echo "IP, Name"
for host in ${networkprefix}.{1..254}; do

name=$(nslookup $host $DNSserver 2>/dev/null | grep "name = " | awk '{print $4}' | sed 's/\.$//')
	if [ -n "$name" ]; then

	echo "$host,$name"
	fi
done

