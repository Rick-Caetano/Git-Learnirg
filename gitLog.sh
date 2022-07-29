#!/bin/bash

function defalutLog(){
    git log 
}

function logByNumbersLine(){
    LINENUMBER=$1
    git log -n $LINENUMBER
}

function logSinceData(){
    DATA=$1
    git log --since=$DATA
}
    
function logUntilData(){
    DATA=$1
    git log --until=$DATA
}

function logByAuthor(){
    AUTHORNAME=$1
    git log --author=$AUTHORNAME
}

function logBySearchTerms() {
    MESSAGE=$1
    git log --grep="$MESSAGE"
}

#logByNumbersLine 2
#logSinceData 2022-06-24
#logUntilData "2022-07-27"
#logByAuthor "rick"
#logBySearchTerms "delete"