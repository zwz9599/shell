#! /bin/bash 



for ip  in  $(seq -f "10.1.1.%g" 11 55 )
do 
 ping -c 1 -W 3 $ip > /dev/null 2>&1
  if [ $? -eq 0 ]; then
   echo "$ip good"
  else 
   echo "$ip bad"
  fi
   
done



