#include <curses.h>
#include <ncurses.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int TELADESEPARACAO(){
    initscr();
    noecho();
    curs_set(0);
    start_color();

    char historia1[1000] = "Acabas-te de adormecer, sobrevive aos monstros do teu sonho e apanha a CURA para sobreviveres.\n";
    char historia2[1000] = "Se por acaso nao conseguires realizar estes objetivos antes das 06:30 AM, MORRERAS!";

    //cria uma janela que preenche toda a tela
    WINDOW* win = newwin(0, 0, 0, 0);

    init_pair(1, COLOR_WHITE, COLOR_BLACK);
    init_pair(2, COLOR_RED, COLOR_BLACK);

    wbkgd(win, COLOR_PAIR(1));
    wattron(win, COLOR_PAIR(1));

    //escreve no centro da janela
    int x, y;
    getmaxyx(win, y, x);

    //fade IN das horas (00:00 AM)
    wattron(win, A_DIM);
    wattron(win, A_STANDOUT);
    mvwprintw(win, (y / 2) - 2, 100, "00:00:00 AM");
    wattroff(win, A_DIM);
    wattroff(win, A_STANDOUT);
    
    //efeito de escrever na historia
    for (int i = 0; historia1[i]!= '\0'; i++){ 
        mvwprintw(win, y / 2, ((x - strlen(historia1)) / 2) + i, "%c", historia1[i]);
        wrefresh(win);
        usleep(10000);
    }
    wattroff(win, COLOR_PAIR(1));


    wattron(win, COLOR_PAIR(2));
    for (int i = 0; historia2[i]!= '\0'; i++){
        mvwprintw(win, (y / 2) + 1, ((x - strlen(historia2)) / 2) + i, "%c", historia2[i]);
        wrefresh(win);
        usleep(10000);
    }
    wattroff(win, COLOR_PAIR(2));  

    //atualiza a janela
    wrefresh(win);

    clear();

    //atualiza a janela
    wrefresh(win);

    //aguarda alguns segundos antes de fechar a janela
    sleep(5);

    //limpa a tela e desativa a biblioteca ncurses
    endwin();

    return 0;
}