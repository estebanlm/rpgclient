#!/bin/bash -x

set -e # exit on error

wget --quiet -O - get.pharo.org/50+vm | bash

./pharo Pharo.image eval --save "
Metacello new 
	baseline: 'RpgClient';
	repository: 'filetree://./mc';
	load.
"

./pharo Pharo.image test --fail-on-failure "RpgClient.*" 2>&1