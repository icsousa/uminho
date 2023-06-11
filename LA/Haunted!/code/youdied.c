#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <curses.h>
#include <ncurses.h>
#include <locale.h>
#include <unistd.h>

int MORTO(){
    char *opcoes[] ={"Menu"};
    int escolha = 0;
    int ch;

    initscr(); // inicializar a tela
    cbreak(); // desativar o buffering de entrada
    noecho(); // não mostrar as teclas digitadas na tela
    keypad(stdscr, TRUE); // ativar a leitura de teclas especiais (como as setas)
    start_color(); // ativar o color de saída

    init_pair(10, COLOR_RED, COLOR_WHITE);
    init_pair(2, COLOR_WHITE, COLOR_BLACK);

    char youdied1[256] = "MORRESTE!\n";

    wattrset(stdscr, COLOR_PAIR(1));
    
    int width, height;
    getmaxyx(stdscr, height, width);

     
    int xMORTE = (width - strlen(youdied1)) / 2;
    int yMORTE = (height / 2) -10;
    
    //print "MORRESTE!" para nao ser atualizado com forme muda a opcao de escolha do jogador
    clear(); // limpar a tela
    attron(COLOR_PAIR(10));
    attron(A_STANDOUT);
    for (int i = 0; youdied1[i] != '\0'; i++){ //efeito de escrever
        mvprintw(yMORTE + 8, xMORTE + i, "%c", youdied1[i]);
        refresh();
        usleep(100000);
    }
    attroff(COLOR_PAIR(10));
    
    
    while (1){
        clear();
        attron(A_STANDOUT);
        attron(COLOR_PAIR(10));
        mvprintw(yMORTE + 8, xMORTE, "%s\n", youdied1);
        attroff(COLOR_PAIR(10));
        attroff(A_STANDOUT);
        refresh();
        for (int i = 0; i < 1; i++){
            if (i == escolha){
                attron(COLOR_PAIR(2));
                attron(A_DIM);
                mvprintw(yMORTE + i + 22, ((width - strlen(opcoes[i])) / 2) - 4 , ">>"); //caracter antes das opções
                attroff(A_DIM);
                attron(A_BLINK); // destacar a opcao selecionada
            }
            mvprintw(yMORTE + i + 22, (width - strlen(opcoes[i])) / 2, "%s\n", opcoes[i]);
            attroff(A_BLINK); // desativar o destaque
            attroff(COLOR_PAIR(2)); //desativar
        }

        refresh(); // atualizar a tela

        ch = getch(); // ler a tecla pressionada

        switch (ch){
            case KEY_UP:
                if (escolha == 0){
                    escolha = 0;
                }
                break;
            case KEY_DOWN:
                if (escolha == 0){
                    escolha = 0;
                }
                break;
            case '\n':
                switch (escolha){
                    case 0:
                        endwin();
                        return 0;
                        break;
                }
                break;
        }
    }

    return 0;
}
