#! /bin/bash

cd /Volumes/HSU/iii/Hadoop_1/shell
git init --shared=0777
ssh-agent -s
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa


while true
do
	file_count="$(ls | wc -l)"
	if [ $file_count -gt 0 ];
		then
		FILES=/Volumes/HSU/iii/Hadoop_1/shell/*
		for f in $FILES
		do
			git add $f
			git status
		  	git commit -m "$(date +%H-%M-%S)"
		  	git status
		  	git branch
		  	git remote add origin git@github.com:hsuyuming/2017_01_23_shellscript.git
		  	git push -u origin master
		  	git remote remove origin
		done
	fi;
	# rm -rf /Volumes/HSU/iii/Hadoop_1/shell/*
	sleep 3
done