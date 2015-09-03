#! /bin/bash

char=(0 1 2 3 4 5 6 7 8 9 a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z ! @ \# $ \&)
numsLowerCase=(0 1 2 3 4 5 6 7 8 9 a b c d e f g h i j k l m n o p q r s t u v w x y z)
numsUpperCase=(0 1 2 3 4 5 6 7 8 9 A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
letters=(a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
numbers=(0 1 2 3 4 5 6 7 8 9)
numChar=(0 1 2 3 4 5 6 7 8 9 a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)

max=${#char[*]}
max2=${#numsLowerCase[*]}
max3=${#numsUpperCase[*]}
max4=${#letters[*]}
max5=${#numbers[*]}
max6=${#numChar[*]}

clear

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+                 Password Generator                 +"
echo "+                   Ctrl-C to exit                   +"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "Length of the password?"
read len

if [[ -n ${len//[0-9]/} ]]; then
	echo "Invalid length, please try again."
        echo "Processing..."
        sleep 3s
        ./PasswordGenerator.sh
fi

echo "What format would you like? (type the option number)"
echo "1. Numbers, letters, and special characters."
echo "2. Numbers and lower case letters."
echo "3. Numbers and upper case letters."
echo "4. Letters."
echo "5. Numbers."
echo "6. Numbers and letters."
read choice

if [ ${choice} -gt "6" ]; then
	echo "Invalid option, please try again."
	echo "Processing..."
	sleep 3s
	./PasswordGenerator.sh
fi

for (( i = 1; i <= ${len}; i++ ))do
    if [ ${choice} -eq "1" ]; then
		let rand=${RANDOM}%${max}
		password="${password}${char[$rand]}"
	elif [ ${choice} -eq "2" ]; then
		let rand=${RANDOM}%${max2}
		password="${password}${numsLowerCase[$rand]}"
	elif [ ${choice} -eq "3" ]; then
		let rand=${RANDOM}%${max3}
		password="${password}${numsUpperCase[$rand]}"
	elif [ ${choice} -eq "4" ]; then
		let rand=${RANDOM}%${max4}
		password="${password}${letters[$rand]}"
	elif [ ${choice} -eq "5" ]; then
		let rand=${RANDOM}%${max5}
		password="${password}${numbers[$rand]}"
	elif [ ${choice} -eq "6" ]; then
		let rand=${RANDOM}%${max6}
		password="${password}${numChar[$rand]}"
	fi
done

echo "Your password is: ${password}"

