#! /bin/bash
<<INFO
AUTHOR:zhaowenzhe@yushu.biz
DATE:2023-04-07
VERSION:0.0.3
INFO

#set -xe


namespace=$1

if [ $# -ne 1 ];then
	echo "param input error"
        exit 1
fi

namespaces=$(kubectl get ns -n $namespace |awk '{print $1}'| grep -v NAME)

echo $namespaces|grep -q $namespace
if [ $? -ne 0 ];then
	echo "namespace not exist"
	exit 1
fi


pods=$(kubectl get pods -n $namespace |awk '{print $1}'| grep -v NAME|grep -v ingress)



for pod in $pods;do
	echo "----------------------------------------"
	echo PodName=$pod
	container_name=$(kubectl describe pod $pod  -n $namespace |grep -B 1 "Container ID:"|grep -v "Container ID:"|sed '2d'|cut -d ":" -f1)

        for container in $container_name;do
         	echo ContainerName=$container
		if [ $container != "filebeat" ];then
			limit_rule=$(kubectl describe pod $pod -n $namespace |grep -A 5 Limits:|head -6|grep -v Liveness|grep -v Readiness|grep -v Environment|grep -v TZ)
			echo Rules=$limit_rule
		else
			limit_rule=$(kubectl describe pod $pod -n $namespace |grep -A 5 Limits:|tail -6|grep -v Liveness|grep -v Readiness|grep -v Environment|grep -v TZ)
			echo Rules=$limit_rule
                fi
        done

done
