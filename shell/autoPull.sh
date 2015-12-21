#!/bin/sh
# 50 */4 * * * sh /Applications/acquia-drupal/python/cs/torrent/autoPull.sh
pull_time=`date +%s`

# Go to folder 'downloads'
cd /Applications/acquia-drupal/python/cs/torrent/downloads

# Receive data from Github
git pull


## Downloading latest films
for file in ./*
do
	if test -f $file
	then
		file_time=`stat -f %m $file` # Linux: stat -c %Y $file, Mac: stat -f %m $file
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