#!bin/bash
> sweep3.txt 
start="1"
end="50"
begin="10.0.5"
for i in $(eval echo "{$start..$end}")
do
nmap -n -v -sn "${begin}.${i}" 2>/dev/null |
grep -B1 "Host is up" |
grep "Nmap scan report" |
awk '{print $5}' >> sweep3.txt
done
