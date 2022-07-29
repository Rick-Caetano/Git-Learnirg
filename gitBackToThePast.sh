#!/bin/bash

source usefulFunctions.sh

    function restoreFile(){

        function show () {
            more modified.me
            echo ' '
            sleep 3.5
        }

        #Restaurando arquivos especificos
        echo "arquivo original: "
        show
        echo "modificação: "
        sed -i 's/#modification/qualquer coisa que eu quiser escrever/g' modified.me #comando linux que procura uma palavra dentro do arquivo e a substitui
        show
        git status #mostra o status do arquivo
        echo "  "
        echo "Arquivo restaurado ao que era:"
        git restore modified.me #restaura o arquivo puxando uma copia que está no repositorio, é possivel usa-lo para desfazer um erro ou recuperar um arquivo
        show
    }

    function restoreFileInStaged(){
        file=/home/rickbobcs/Documentos/codigos/git/$value
        git restore --staged $file #podemos restaurar arquivos da stage Area com o git restore também
    }

    function amendCommit(){
        #corrigir ultimo commit
        echo "Type message to emend point in history: "
        read message
        git commit --amend -m $message # corrige o ultimo commit, pra isso devemos fazer as alterações antes é da um "git add". caso quiser mudar a mensagem do commit, basta não alterar nada e rodar o comando 
    }

    function restoreCommit() {
        #restaurando arquivos de commits anteriores
        git log --oneline
        echo "digite a hash do commit para resgatar um arquivo: "
        read initialHash
        git checkout $initialHash -- recupere.me
        more recupere.me
        ls -lhra recupere.me
        rm recupere.me
    }

    function revert(){
        #revertendo multiplos arquivos
        #vamos pergar um ponto na historia, reverter e criar um novo ponto na historia 
        #a contagem da reversão é feita pela hash ou a partir do head, os commits anteriores são acontados como: head -1, head-2, head-3 em assim vai...
        hasing=$value
        git revert $hasing # ou git revert HEAD~1  

    }
