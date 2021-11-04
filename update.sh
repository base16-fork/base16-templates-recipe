#!/bin/sh

test -f ./builder/cbase16.cpp || git clone https://github.com/base16-fork/cbase16 ./builder
make -C ./builder
./builder/cbase16 update -l -c ./

for d in $(find ./templates -maxdepth 2 -type d -name "templates"); do 
	if [ ! -d "$(echo $d | cut -d '/' -f3)" ] && [ ! -z "$(echo $d | cut -d '/' -f3)" ]; then
		mkdir "$(echo $d | cut -d '/' -f3)"
	fi

	cp -rf "$d" "$(dirname $d | sed "s/\.\/templates/\./")/"
done
