#! /bin/bash
#auther: zwz9599


function jindu () {
   while :    # while : 无限循环，或者写作 while true
    do
        echo -n "#"
        sleep 0.2
   done
   

}
jindu &
cp -a $1 $2
kill -15 $!
echo "拷贝完成"
