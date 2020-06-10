#!/bin/bash

  

clear
res=0
i="y"
while [ $i = "y" ]
do
echo "Enter two numbers:"
read num1
read num2
echo "1.Addition"
echo "2.Subtraction"
echo "3.Multiplication"
echo "4.Division"
echo "5.Modulus"
echo "Enter your choice"
read ch
case $ch in
    1)res=`expr $num1 + $num2`
     echo "Sum ="$res;;
        2)res=`expr $num1 - $num2`
     echo "Differnce = "$res;;
    3)res=`expr $num1 \* $num2`
     echo "Product = "$res;;
    4)res=`expr $num1 / $num2`
     echo "Quotient = "$res;;
    5)res=`expr $num1 % $num2`
      echo "Remainder = "$res;;
    *)echo "Invalid ch";;
esac
echo "Press y to continue:"
read i
if [ $i != "y" ]
then
    exit
fi
done    


