#! /bin/bash 

#判断传入参数的个数，如果参数个数不等于1，程序退出
if [ $# -ne 1 ]; then
 echo "参数错误"
 exit 1
else
  
line=$1 #变量1

for ip  in  $(cat $line )
do 
 echo "$ip"
 ping -c 2 -W 3 $ip > /dev/null 2>&1 &
  if [ $? -eq 0 ]; then
   echo "good"
  else 
   echo "bad"
  fi
   
done
fi


