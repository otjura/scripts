#!/bin/bash
#fun with never indenting anything
echo "Hello!"
read reply
if [ "$reply" == "hello" || "$reply" == "hi" ]; then
echo "So nice to meet you, $USER!"
else
echo "That was not polite I think..."
fi

echo "Reply shortly here okay"
read -n1 reply
if [ "$reply" == "a" ]
then
echo "Aaaaaaaaa"
elif [ "$reply" == "b" ]
then
echo "Beeeeeeeeeeeeeeeeee"
elif [ "$reply" == "c" ]
then
echo "cheeeeeeeeese!"
else
echo "$reply is fine character, too"
fi
echo "Thou shall not pass!"
count=0
while [ $count -le 5 ]
do 
echo "Say password:"
read pass
if [ "$pass" == "qwerty" ]
then
echo "Wow such hack very cool!"
count=6
else
((count++))
echo "Wrong guesses: $count"
fi
if [ $count == 5 ]
then
echo "You are not hacker!"
fi
done
