#!/bin/bash

source usefulFunctions.sh

function createNewCommit(){
    COMMANDSINTAX1=`coloredWords "git add ." "31m" 0 "37m"`
    COMMANDSINTAX2=`coloredWords "git commit -m 'MESSAGEHERE'" "31m" 0 "37m"`

    #Explication
    textWrite "This Command $COMMANDSINTAX2 create a nem point in history of your project, that is what we call a commit." true
    textWrite "before then we use the $COMMANDSINTAX1 to send all files for Stage Area. You can send individual files too, but you need replace '.' by name of file"

    git status
    echo "type a message of commit: "
    read commitMessage
    git add . 
    git commit -m $commitMessage 
}

function firstCommit(){
    COMMANDSINTAX=`coloredWords "'git init'" "31m" 0 "37m"`
    textWrite "First, you need use $COMMANDSINTAX command to inicialize the git in your directory." true
    #rm -rf .git
    git init
    textWrite "type for message 'first commit' or something like that..." false
    createNewCommit
}

function renameFile(){
    #sitax here
    oldFileName=$1
    newFileName=$2
    ls -lhra $oldFileName
    git mv $oldFileName $newFileName #mv renomeia um arquivo ou move (mesma coisa de linux)
    ls -lhra $newFileName
}

function removeFile() {
    FILETOREMOVE=$1

    #git rm --cached NomedoArquivo -> remove da stage area os arquivos passados errados com o add. Podemos também usa-lo para remover arquivos do projeto
    createContentFile "remove.me" "Estou tão solitario, sempre sozinho... tão sozinho! Deus, alguem me liberte dessa solidão"
    ls -lhr
    git rm $FILETOREMOVE
}

function removeFileStaged() {
    FILETOREMOVE=$1

    git status
    git rm --staged $FILETOREMOVE
}

function removeUntrackedFiles(){
    #sintax here
    git clean -f #remove permanentemente os arquivos que não estão sendo rastreados, ou seja, aqueles em que não estão no repositorio. Cuidado com esse comando, antes de usar, dê um 'git add FileName' nos arquivo que deseja que sejam rastreaveis 
}

COUNT=0
function commitTrackedFiles() {

    if [ $COUNT -eq 0 ] 
    then
        echo "echo type value: "
    fi

    read value

    if [ $value -eq 1 ] 
    then
       git commit -a #quando os arquivos ja foram rastreados, ou seja, usou-se git init alguma vez, basta usar o comando para fazer o commit logo em vez de usar o add... pula uma etapa.
    elif [ $value -eq 2 ]
    then
        echo "inform a message for commit: "
        read $message
        git commit -am $message 
    else
        let "COUNT+=1"
        echo "retype valid value: "
        commitTrackedFiles 
    fi
}

function compairCommits(){
    #sintax here
    git log --oneline
    echo "type commit hash: "
    read hasing
    git show $hasing --color-words #compara um commit especifico com o atual. Monstrado data de criaçao dos arquivos e palavras adicionadas ou retiradas é como o git diff, mas pra commits. pode-mos especificar também as pastas que serão comparadas
}

function compairDirCommits(){
    #sintax here
    git log --oneline
    echo "type commit hash: "
    read hasing
    echo "name"
    git show $hasing --nlw-03-discovery/src/views --color-words #compara especificando as pasta
}

function compairFiles(){
    #sintax here
    git diff --color-words #Pega o que tem no working directory(local) e compara com o que tem na stage Area
}

function compairFileStaged(){
    #sintax here
    git diff --staged --color-words #pega o que tem na stage area e compara com o que tem lá no repositorio
}

#podemos usa-lo para diferenciar o arquivo modificado, comparando a versão atual com a antiga

function removeFileAfterCommit() {
    #sintax here
    git status
    echo "what file you want remove? "
    read file
    git rm -r $file --chached #Caso tenhamos colocado algum arquivo que devia ser ignorado no projeto, devemos primeiro criar o git ignore, colocar o nome do arquivo, usar o "git rm -r --cached" para parar de rastrar o arquivo, logo depois basta usar o "git add ." e o "git commit"
}
