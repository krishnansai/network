
#!/bin/bash
echo Please Enter the Ip-address
read ip
echo It\'s your ip to scan $ip

nmap -vvv $ip | awk '/open/{print $1 " "$2" " $3 "\n"}'
