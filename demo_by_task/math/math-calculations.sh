echo 'echo $((55 / 3))'
echo $((55 / 3))

echo 'echo $(expr 55 / 3)'
echo $(expr 55 / 3)

echo 'echo "scale=4 ; 55 / 3" | bc'
echo "scale=4 ; 55 / 3" | bc
