#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <curses.h>
#include <ncurses.h>
#include <locale.h>
#include <unistd.h>

int WIN(){
    char *opcoes[] ={"Menu"};
    int escolha = 0;
    int ch;

    initscr(); // inicializar a tela
    cbreak(); // desativar o buffering de entrada
    noecho(); // não mostrar as teclas digitadas na tela
    keypad(stdscr, TRUE); // ativar a leitura de teclas especiais (como as setas)
    start_color(); // ativar o color de saída

    init_pair(9, COLOR_GREEN, COLOR_WHITE);
    init_pair(2, COLOR_WHITE, COLOR_BLACK);
    init_pair(1, COLOR_RED, COLOR_BLACK);

    char winner[256] = "SOBREVIVESTE!\n";

    wattrset(stdscr, COLOR_PAIR(9));
    
    int width, height;
    getmaxyx(stdscr, height, width);

    char historia1[1000] = "Por enquanto vais poder dormir sem qualquer tipo de preocupacao...\n";
    char historia2[1000] = "Mas ao voltar ao (Menu) voltas a ser";
    char historia3[1000] = " HAUNTED!";

    int x = (width - strlen(winner)) / 2;
    int y = (height / 2) -10;
    
    //print "MORRESTE!" para nao ser atualizado com forme muda a opcao de escolha do jogador
    clear(); // limpar a tela
    attron(A_STANDOUT);
    attron(COLOR_PAIR(9));
    for (int i = 0; winner[i] != '\0'; i++){ //efeito de escrever
        mvprintw(y + 8, x + i, "%c", winner[i]);
        refresh();
        usleep(100000);
    }
    attroff(COLOR_PAIR(9));
    attroff(A_STANDOUT);
    
    attron(COLOR_PAIR(2));
    for (int i = 0; historia1[i]!= '\0'; i++){ 
        mvprintw(y + 10, width / 2 - ((strlen(historia1)) / 2) + i, "%c", historia1[i]);
        refresh();
        usleep(10000);
    }

    for (int i = 0; historia2[i]!= '\0'; i++){
        mvprintw((y + 10) + 1,  width / 2 - (((strlen(historia2)) + 9) / 2) + i, "%c", historia2[i]);
        refresh();
        usleep(10000);
    }
    attroff(COLOR_PAIR(2));
    attron(COLOR_PAIR(1));
    for (int i = 0; historia3[i]!= '\0'; i++){
        mvprintw((y + 10) + 1,  width / 2 - (((strlen(historia2)) + 9) / 2) + 36 + i, "%c", historia3[i]);
        refresh();
        usleep(10000);
    }
    attroff(COLOR_PAIR(1));
    
    while (1){
        clear();
        attron(COLOR_PAIR(9));
        attron(A_STANDOUT);
        mvprintw(y + 8, x, "%s\n", winner);
        attroff(COLOR_PAIR(9));
        attroff(A_STANDOUT);
        attron(COLOR_PAIR(2));
        mvprintw(y + 10, width / 2 - ((strlen(historia1)) / 2), "%s", historia1);
        mvprintw((y + 10) + 1, width / 2 - (((strlen(historia2)) + 9) / 2), "%s", historia2);
        attroff(COLOR_PAIR(2));
        attron(COLOR_PAIR(1));
        mvprintw((y + 10) + 1,  width / 2 - (((strlen(historia2)) + 9) / 2) + 36, "%s", historia3);
        attroff(COLOR_PAIR(1));
        refresh();
        for (int i = 0; i < 1; i++){
            if (i == escolha){
                attron(COLOR_PAIR(2));
                attron(A_DIM);
                mvprintw(y + i + 22, ((width - strlen(opcoes[i])) / 2) - 4 , ">>"); //caracter antes das opções
                attroff(A_DIM);
                attron(A_BLINK); // destacar a opcao selecionada
            }
            mvprintw(y + i + 22, (width - strlen(opcoes[i])) / 2, "%s\n", opcoes[i]);
            attroff(A_BLINK); // desativar o destaque
            attroff(COLOR_PAIR(2)); //desativar
        }

        refresh(); // atualizar a tela

        ch = getch(); // ler a tecla pressionada

        switch (ch){
            case KEY_UP:
                if (escolha < 0){
                    escolha = 0;
                }
                break;
            case KEY_DOWN:
                if (escolha > 1){
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
