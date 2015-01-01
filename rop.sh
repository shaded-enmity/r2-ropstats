#!/bin/bash

for file in $*; do
	echo "$file"
	gadget-stats $file 2>/dev/null
done


