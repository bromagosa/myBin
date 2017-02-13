#while (test 0 -eq 0);
while true
do
    zenity --question --text="`fortune` \n \n Speak again?" x y && echo "again" > /dev/null || exit;
done
