#!/bin/bash

source gitBackToThePast.sh
source gitBasic.sh
source gitLog.sh
source usefulFunctions.sh

function gitBasiComands(){
    firstCommit
    textWrite "Now, let's change name of 'rename.me' file. type new name: " true
    read newname
    renameFile "rename.me" $newname
    textWrite "Now that we've changed name of file, we need a new commit \n" true 
    createNewCommit
    createContentFile untrack.me "Are they tracking me?! I have to hide... I can't just stand here."
    echo "untracked file say: " && cat untrack.me
    removeUntrackedFiles
    pressEnter
}

function gitLogComands(){

    echo "
    1- git log -> Log completo dos ultimos commits
    2- git log -n 5 -> tras apenas os ultimos cinco commits
    3- git log --since=DATAHERE -> tras os commits desde a data passada
    4- git log --until=DATAHERE -> tras commits anteriores a essa data
    5- git log --author=AUTHORHERE -> tras commits por autor
    6- git log --grep='TERMOFSEARCHERE' ->tras commits pela mensagem do commit

**Caso nada seja retornado, então é porque não teve resultados na pesquisa**
    "

    read opcao;
    if [ $opcao == "1" ];
    then
        clear
        defalutLog
    elif [ $opcao == "2" ];
    then
        clear
        echo "type numbers of line do you want see: "
        read LINES
        logByNumbersLine $LINES
    elif [ $opcao == "3" ];
    then
        echo "inform data to log: "
        read DATA
        logSinceData $DATA
    elif [ $opcao == "4" ];
    then
        clear
        echo "inform data to log: "
        read DATA
        logUntilData $DATA
    elif [ $opcao == "5" ];
    then
        clear
        echo "whats author name? "
        read AUTHOR
        logByAuthor $AUTHOR 
    elif [ $opcao == "6" ];
    then
        clear
        echo "insert a term to search in timelines: "
        read TERM
        logBySearchTerms $TERM
    else
        clear
        echo "      
                    *->option is not valid<-*         
        "
        gitLogComands
    fi
}

function gitReturnTimeComands(){

    textWrite "Acionando maquina do tempo... Escolha sua a ação que deseja para voltar ao passado: "
    textWrite "
    1- Restaurar arquivo
    2- Restaurar arquivo da stage area
    3- arrumar ultimo ultimo ponto na historia    
    4- Recuperar arquivo arquivos
    5- reverter o ponto na historia atual e fazer um salto temporal
    "

    echo "ação: "
    read choice

    case $choice in
    1)  restoreFile
        textWrite "*O 'git restore' restaura o arquivo puxando uma copia que está no repositorio.É possivel usa-lo para desfazer um erro ou recuperar um arquivo*" ;;
    2)  restoreFileInStaged "modified.me"
        textWrite "*Podemos restaurar arquivos da stage Area com o 'git restore --staged FILENAME'*";;
    3)  amendCommit
        textWrite "*git commit -amend -m 'sua mensagem' -> corrige o ultimo commit (ponto na historia). Caso seja preciso mudar algum arquivo, deve antes dar um git add e coloca-lo na Stage Area. Se apenas deseja mudar a mensagem do commit, basta não alterar nada e rodar o comando*";;
    4) restoreCommit
       textWrite "*git checkout HashOfCommitHere  -- File -> Usado para recupera um arquivo de um commit anterior*";;
    5) revert
       textWrite "git revert HasingHere -> reverte o ponto atual na historia com um commit anterior e cria um novo ponto, afetando multiplos arquivos";;
    *) echo "ERROR! Time machine is broken, return to atual point in the history";;
    esac

    textWrite "Right! Process complete, finishing time machine";
}

function run(){
    echo "hello $USER"
    readInfo "This code is based on choices. The environment created here is just for testing and is for you to see the basic actions of git for the day to day of the programmer. *The purpose of using the shell script is just to make it more dynamic, since git runs on the command line*. Well, let's get started..."
    clear
    gitBasiComands
}

#saida=`coloredWords "amor" "32m" 01 "37m"` #salva o retorno da função
#echo "sla $saida" #mostra o retorno

run

