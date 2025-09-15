
#!/bin/bash
# check if exactly  2 arguments were provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <hostfile> <portfile>"
    echo "Error: Please provide exactly 2 files - a host file and a port file"
    exit 1
fi
hostfile=$1
portfile=$2
echo "Host, Port"
for host in $(cat "${hostfile}"); do
	for port in $(cat "${portfile}"); do
		timeout .1  bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null && 
		echo "$host,$port"
	done
done

