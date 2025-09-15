#!bin/bash
> sweep.txt
start="1"
end="50"
begin="10.0.5"
for i in $(eval echo "{$start..$end}")
do 
ping -c 1 "${begin}.${i}"|
grep "64 bytes"|
grep -E -o "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" >> sweep.txt
done
