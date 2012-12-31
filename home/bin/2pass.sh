#/bin/bash -x

## A wrapper script around mencoder to help convert videos to a common format

INPUT=$1
OUTPUT=$2

if [ -z "$OUTPUT" ]; then
  echo "Usage: $0 <INPUT> <OUTPUT>"
  echo "Example: $0 \"dvd://$i -dvd-device /path/to/dvd_dir\" output.avi"
  exit 0
fi

# xvid
SHARED="$INPUT -oac mp3lame"
xvopts="bitrate=1600"
vf="scale=320:240"

mencoder $SHARED -ovc xvid -xvidencopts pass=1 -vf "$vf" -o /dev/null
mencoder $SHARED -ovc xvid -xvidencopts $xvopts:pass=2 -vf "$vf" -o "$OUTPUT"

# MSMPEG4v2
#SHARED="$INPUT -oac mp3lame"
#opt="vbitrate=800000"
#
#mencoder $INPUT -ovc lavc -lavcopts vcodec=msmpeg4v2:vpass=1:$opt -vf "$vf" -nosound -o /dev/null
#mencoder $SHARED -ovc lavc -lavcopts vcodec=msmpeg4v2:vpass=2:$opt -vf "$vf" -o $OUTPUT
