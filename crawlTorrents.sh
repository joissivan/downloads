#!/bin/sh
# start mail server: nohup python -m smtpd -n -c DebuggingServer localhost:1025 > /Applications/acquia-drupal/python/cs/torrent/myout.file 2>&1 &
# 0 */4 * * * sh /Applications/acquia-drupal/python/cs/torrent/crawlTorrents.sh
# command: scrapy crawl torrent -a keyword=lost -a perfect=1

# start mail server 
#if test $( pgrep -f python | wc -l ) -eq 0
#then
#	nohup python -m smtpd -n -c DebuggingServer localhost:1025 > /Applications/acquia-drupal/python/cs/torrent/myout.file 2>&1 &
#fi

# read movie list & run spider
cd /Applications/acquia-drupal/python/cs
while read keyword
do
	echo "["`date "+%Y-%m-%d %H:%M:%S"`"]Run spider to crawl:" $keyword >> /Applications/acquia-drupal/python/cs/torrent/myout.file
	/usr/local/bin/scrapy crawl torrent -a keyword=$keyword -a perfect=1
done < /Applications/acquia-drupal/php/joissivan.txt

# check whether spider has done 
if test $( pgrep -f scrapy | wc -l ) -ne 0
then
	echo "Kill it." | mutt -s "[`date`] Spider has encountered a problem." jois4mac@gmail.com
fi
