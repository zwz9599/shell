function ipAdd () {
  for (( i=11;i<=55;i++ ))
  do 
    ping -c 1 -W 3 10.1.$a.$i > /dev/null 2>&1
  done
}


for (( a=1;a<=7;a++ ))
do
  ipAdd
done

