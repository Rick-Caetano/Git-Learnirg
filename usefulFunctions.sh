
function textWrite(){
    text=$1
    echo " $text "
    #sleep
}

createContentFile() {
    ARCHIVE=$1
    FILECONTENT=$2
    if [ ! -e $ARCHIVE ]
    then
        touch $ARCHIVE
    fi

    echo $FILECONTENT >> $ARCHIVE
}

coloredWords() {
    #https://www.vivaolinux.com.br/artigo/Formatando-o-bash-com-cores-e-efeitos
    #http://www.bosontreinamentos.com.br/shell-script/curso-de-shell-scripting-retornando-valores-em-funcoes-e-status-de-saida/
    WORD=$1
    COLOR=$2 #passar o numero como string e colocar 'm' no final
    ESTILE=$3
    BACKGROUND=$4 #passar o numero como string e colocar 'm' no final

    echo -e "\033[$ESTILE;$COLOR$WORD\033[$ESTILE;$BACKGROUND"
}

function readInfo() {
    CONTENT=$1
    INFOFILE="info.txt"

    if [ -e $INFOFILE ]
    then
        rm $INFOFILE
    fi

    touch $INFOFILE
    echo $CONTENT
    cat $INFOFILE
    textWrite "Type any enter to continue..."
    read 
}