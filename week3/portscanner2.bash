
#!/bin/bash

network=$1
port=$2
echo "Host, Port"
for host in ${network}.{1..254}; do
	for port in $port; do
		timeout .1  bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null && 
		echo "$host,$port"
	done
done

