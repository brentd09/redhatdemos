#!/bin/bash

grep 'code' linux-poem.txt
grep 'the' linux-poem.txt
grep -i 'the' linux-poem.txt
grep -i '^the' linux-poem.txt
grep '.' linux-poem.txt
grep '\.' linux-poem.txt
grep -iP '(?<=joined )the' linux-poem.txt
grep -iv 'code' linux-poem.txt
