# A simple configurable backup script in Bash

Create a file named "paths", add an absolute path in it. For starters:

    echo "$PWD/.ssh" > paths

Create another file named "exclude", add a path or pattern that _tar --exclude_ would accept.

    echo "$PWD/backup-*.tar" > exclude

In the same directory, copy the below script to a file, let's name it backup.sh. 

	#!/bin/bash
	SCRIPT_DIR=$(dirname -- "$(readlink -e -- "$BASH_SOURCE")")
	timestamp=$(date +"%Y-%m-%d-%H-%M-%S")
	archive="$SCRIPT_DIR/backup-$timestamp.tar"
	target=""
	exclude=""
	while IFS='' read -r line || [[ -n "$line" ]]
	do
	  if [[ $line != "#"* ]]; then
		target="$target $line"
	  fi
	done < $SCRIPT_DIR/paths
	while IFS='' read -r line || [[ -n "$line" ]]
	do
	  if [[ $line != "#"* ]]; then
		exclude="$exclude --exclude=\"$line\""
	  fi
	done < $SCRIPT_DIR/exclude
	eval "tar -czvf $archive $target $exclude"
	exit 0


Make sure you give it execute permissions (chmod +x backup.sh). Depending on the paths you configure it to backup, you may need to run it with sudo. 


