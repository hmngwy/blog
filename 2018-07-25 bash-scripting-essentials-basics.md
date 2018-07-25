# Bash Scripting Essentials

### Exit on Command Failure

Without explicit configuration your script will continue to run even after it encounters an error, by setting this command your script will exit as soon as it encounters a failure. 

```
set -e
```

However I would recommend that you handle failed commands in your script instead to make it more robust.

### Responding to Command Failure

You can check commands whether they were successful or not in if else statements by checking the exit status code with `$?` then respond accordingly. `$?` will always contain the last exit status code.

```
mktemp
if [ $? -eq 0 ]; then
  echo "temp file created"
else
  echo "temp file creation failed"
fi
```

Similarly you can use commands directly in the if statements to test whether they succeeded.

```
if grep nope /dev/null; then
  echo "found it"
else
  echo "not there"
fi
```

### Modularization with Functions

Bash functions behave like bash scripts, it can receive arguments, and return exit status codes.

```
function my_method {  
  echo $@
  exit 0
}
MYVAR=$(my_method "hello")
echo $MYVAR
```

### Exit Status Code

Your bash script can report whether it successfully executed its goal, any status code other than 0 means it has failed. This would be handy if a consumer needs to react depending on the execution’s result, like a CI. 

```
exit 0
```

### Background Services

You can put a service in the background if it's needed by your script to fulfill its goal. 

```
python -m http.server 8080 &
```

You can kill it later as part of your cleanup/teardown step using `lsof`.

```
kill -9 $(lsof -i :8080)
```

`lsof` finds the pid of the process, which `kill` then terminates.

### Redirecting Output

A background service might be noisy, and that usually isn't ideal. You can hush it by redirecting its output to a file or /dev/null.

```
python -m http.server 8080 > /dev/null &
```

This would redirect stdout to /dev/null, you may still see errors if they are printed to stderr. To hush that as well you may use:

```
python -m http.server 8080 > /dev/null 2>&1 &
```

#### The brief explanation here is that:
`2>&1` means you are redirecting `stderr (2) into stdout (1)`, and since you are sending stdout to /dev/null, you are effectively doing the below:

```
stderr > stdout > /dev/null
```

### Short CLI Options

`getopts` may not be the best CLI options parser, but it's what everyone has, from macOS to Linux based machines.

The first thing to learn is defining options, `getopts` accepts a string to define the parameters it will parse. The basic rules are: 

- `h` will check for the presence of `-h` in your command options
- `h:` will check for the presence `-h` and a **parameter**

```
#!/usr/bin/env bash
while getopts "h:ij" arg; do
  case $arg in
    h) 
      echo "h is ${OPTARG}"
      ;;
    i) 
      echo "p is present"
      ;;
    j) 
      echo "p is present"
      ;;
  esac
done
```

The above setup will expect an option `-h` with a parameter, and `-p` and `-j` without parameters. `${OPTARG}` will always contain the parameter for the current option in the iteration.

This bash script can be executed with the following options `./script.sh -h hello -i -j`. There is more to `getopts` aside from what I covered here, I'll leave it to you to learn the rest.

This should be enough to get you started with a basic yet robust shell script. For additional reading, I recommend [Ten Things I Wish I’d Known About bash](https://zwischenzugs.com/2018/01/06/ten-things-i-wish-id-known-about-bash/) by zwischenzugs.