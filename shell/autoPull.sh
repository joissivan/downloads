#!/bin/sh
# ssh root@192.168.3.105
# 50 */4 * * * sh /home/sivan/downloads/shell/autoPull.sh
# mac: sh /Applications/acquia-drupal/python/cs/torrent/downloads/shell/autoPull.sh

pull_time=`date +%s`

# Go to folder 'downloads'
if [ `hostname` = "sivandeMacBook-Air.local" ]
	then
		cd /Applications/acquia-drupal/python/cs/torrent/downloads
		host_name="mac"
elif [ `hostname` = "tt" ]
	then
    	cd /home/sivan/downloads
		host_name="pc"
fi

# Receive data from Github
git pull

## Downloading latest films
for file in ./*
do
	if test -f $file
	then

		if [ $host_name = "mac" ]
		then
			file_time=`stat -f %m $file`
		elif [ $host_name = "pc" ]
		then
			file_time=`stat -c %Y $file`
		fi
		
		if [ $file_time -gt $pull_time ]
		then

			## ADD DOWNLOAD CODE HERE!!!
			echo $file



		fi
	fi
done



## After downloaded, delete torrent/ftpNote & push <deleted> it to Github
#git rm {filename1} {filename2} ...
#git commit -m "deleted {filenames}"
#git push



## Send mail to me
#echo "{filename}下好了" | mutt -s "Welcome Home" sivan.wang@askmedia.com