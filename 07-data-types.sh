#!/bin/bash
NUM1=10
NUM2=linux
SUM=$($NUM1+$NUM2)
echo "sum is $SUM"
## Array
MOVIES =("RRR", "KGF", "Bahubali") # index is RRR always 0, KGF is 1 and Bahubali is 2
echo "movies are: ${MOVIES[@]}
echo "first movie is : ${MMOVIE[0]}"
echo "second movie is : ${MOVIE[1]}"

