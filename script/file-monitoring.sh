#!/bin/sh

# Exclude the file type of the listening
EXCLUDE_FILE_TYPE="(.html|.htm|.css|.js|.png|.gz|.txt|.zip|.bak)"

# What events to listen for
# Optional events include: aclass\modify\attrib\open\create...
MONITORING_EVENT="modify,delete,create,close_write"

# Listening directory
MONITORING_DIR='/data/httpd/docker/lnmpr'

# Log files for monitoring changes for future reference
MONITORING_LOG='/tmp/inotifywait.out.log'

# Save these change files
SAVE_CHANGE_FILE_DIR='/data/httpd/backup/'

# To start listening to
# OUT_DIR   = The folder where the output changes
# OUT_EVENT = Events that produce change
# OUT_FILE  = A file that produces a change of output
inotifywait -mrq --exclude $EXCLUDE_FILE_TYPE -e $MONITORING_EVENT $MONITORING_DIR | while read OUT_DIR OUT_EVENT OUT_FILE 
do
    # Written to the log
 	echo `date "+%Y-%m-%d %H:%M:%S"`" "$OUT_DIR$OUT_FILE" "$OUT_EVENT >> $MONITORING_LOG
  	# Do different processing according to the event type
	case $OUT_EVENT in
	   "DELETE")
			echo $OUT_DIR$OUT_FILE,'this delete file'
		;;
	   "CREATE")
		    FILE_EXT="${OUT_FILE##*.}"
			if [ $FILE_EXT == "php" ]
			then
				echo "this is php"
			fi	
			# echo $FILE_EXT
			echo $OUT_DIR$OUT_FILE,'this create file'
		;;
	   *)
		 	echo $OUT_DIR$OUT_FILE,'this change file'
		;;
   esac	
done
