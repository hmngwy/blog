# Monitoring Changes In a Directory

I've automated the building process of the site using inotifywait, a binary that when executed listens for pre-determined events on a specified path and then executes a set of instructions.

It's available in the Raspbian repositories, so:

    sudo apt-get install inotify-tools

The set up is simple, tell inotifywait to wait for a file write, move, and delete events on the posts directory, and then run the build pushing in the event trigger's filename as an argument. The build script does the rest of the work.

Here's the whole script:

    #!/bin/bash
    # Runs build when posts folder changes
    inotifywait -m -q -e move -e close_write -e delete --format "%f" "/home/user/posts" |
      while IFS= read -r file; do
        EXT=${file##*.}
        if [ $EXT == "md" ]; then
          echo "File $file modified, running build"
          (cd /home/user/posts; build "$file")
          chown -R www:www /var/www/html
        fi
      done
