#include <curses.h>
#include <ncurses.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>


int info(){
    initscr();
    noecho();
    curs_set(0);
    start_color();

    char historia1[1000] = "Ainda bem que ca vieste, qualquer duvida que possas ter, vais estas esclarecida aqui!\n";
    char historia2[1000] = "Acabaste de cair num sonho em que foste amaldicoado, o objetivo e apanhar a cura ";
    char historia3[1000] = "C"; //magenta standout
    char historia4[1000] = ". Sendo que tens de matar 21 monstros ";
    char historia5[1000] = "M e E"; //verelho e bolt
    char historia6[1000] = "O teu boneco mexesse utlizando as setas ";
    char historia7[1000] = "KEY_UP, KEY_DOWN, KEY_LEFT e KEY_RIGHT";//deixar em ciano
    char historia8[1000] = "Os pontos amarelos (";
    char historia9[1000] = ".";//deixar em amrelo com dim
    char historia10[1000] = "), sao o raio de visao do teu boneco (@)";
    char historia11[1000] = "O teu boneco tem uma arma que e disparada quando e pressionada a tecla ";
    char historia12[1000] = "1";//ciano
    char historia13[1000] = "Nem o teu boneco, nem os monstros conseguem passar ou atacar pelos obstaculos (#, A, P)";
    char historia14[1000] = "(pressiona qualquer tecla para voltar ao Menu)";
    char historia15[1000] = " - Enquanto que M so ataque corpo a corpo, E utiliza seu arco (a uma distancia de 5), mas apenas nos atinge se nao tiver nenhum ostaculo a sua volta (raio de 2)";


    //cria uma janela que preenche toda a tela
    WINDOW* win = newwin(0, 0, 0, 0);

    init_pair(2, COLOR_WHITE, COLOR_BLACK);
    init_pair(1, COLOR_RED, COLOR_BLACK);
    init_pair(6, COLOR_MAGENTA, COLOR_WHITE);
    init_pair(11, COLOR_CYAN, COLOR_BLACK);
    init_pair(5, COLOR_YELLOW, COLOR_BLACK);

    wbkgd(win, COLOR_PAIR(2));
    wattron(win, COLOR_PAIR(2));

    //escreve no centro da janela
    int x, y;
    getmaxyx(win, y, x);
    while(1){
        wattron(win, A_STANDOUT);
        mvwprintw(win, (y / 2) - 2, (x / 2) , "INFO");
        wattroff(win, A_STANDOUT);
        
        //efeito de escrever na historia
        for (int i = 0; historia1[i]!= '\0'; i++){ 
            mvwprintw(win, y / 2, x / 2 - ((strlen(historia2)) / 2) + i, "%c", historia1[i]);
            wrefresh(win);
            usleep(10000);
        }
        wattroff(win, COLOR_PAIR(2));


        wattron(win, COLOR_PAIR(2));
        for (int i = 0; historia2[i]!= '\0'; i++){
            mvwprintw(win, (y / 2) + 1, x / 2 - (((strlen(historia2)) + 2 + 38 + 1 + 4) / 2) + i, "%c", historia2[i]);
            wrefresh(win);
            usleep(10000);
        }
        wattroff(win, COLOR_PAIR(2));  

        wattron(win, COLOR_PAIR(6));
        wattron(win, A_STANDOUT);
        for (int i = 0; historia3[i]!= '\0'; i++){
            mvwprintw(win, (y / 2) + 1, x / 2 - (((strlen(historia2)) + 2 + 38 + 1 + 4) / 2) + 81 + i, "%c", historia3[i]);
            wrefresh(win);
            usleep(10000);
        }
        wattroff(win, COLOR_PAIR(6));
        wattroff(win, A_STANDOUT); 

        wattron(win, COLOR_PAIR(2));
        for (int i = 0; historia4[i]!= '\0'; i++){
            mvwprintw(win, (y / 2) + 1, x / 2 - (((strlen(historia2)) + 2 + 38 + 1 + 4) / 2) + 82 + i, "%c", historia4[i]);
            wrefresh(win);
            usleep(10000);
        }
        wattroff(win, COLOR_PAIR(2));  

        wattron(win, COLOR_PAIR(1));
        wattron(win, A_BOLD);
        for (int i = 0; historia5[i]!= '\0'; i++){
            mvwprintw(win, (y / 2) + 1, x / 2 - (((strlen(historia5)) + 2 + 38 + 1 + 4) / 2) + 82 + i, "%c", historia5[i]);
            wrefresh(win);
            usleep(10000);
        }
        wattroff(win, COLOR_PAIR(1));
        wattroff(win, A_BOLD); 

        wattron(win, COLOR_PAIR(2));
        for (int i = 0; historia6[i]!= '\0'; i++){
            mvwprintw(win, (y / 2) + 2, x / 2 - (((strlen(historia6)) + 38) / 2)+ i, "%c", historia6[i]);
            wrefresh(win);
            usleep(10000);
        }
        wattroff(win, COLOR_PAIR(2)); 

        wattron(win, COLOR_PAIR(11));
        for (int i = 0; historia7[i]!= '\0'; i++){
            mvwprintw(win, (y / 2) + 2, x / 2 - (((strlen(historia7)) + 38) / 2) + 40 + i, "%c", historia7[i]);
            wrefresh(win);
            usleep(10000);
        }
        wattroff(win, COLOR_PAIR(11));

        wattron(win, COLOR_PAIR(2));
        for (int i = 0; historia8[i]!= '\0'; i++){
            mvwprintw(win, (y / 2) + 3, x / 2 - (((strlen(historia8)) + 40) / 2)+ i, "%c", historia8[i]);
            wrefresh(win);
            usleep(10000);
        }
        wattroff(win, COLOR_PAIR(2));

        wattron(win, COLOR_PAIR(5));
        for (int i = 0; historia9[i]!= '\0'; i++){
            mvwprintw(win, (y / 2) + 3, x / 2 - (((strlen(historia9)) + 40) / 2) + 10 + i , "%c", historia9[i]);
            wrefresh(win);
            usleep(10000);
        }
        wattroff(win, COLOR_PAIR(5)); 

        wattron(win, COLOR_PAIR(2));
        for (int i = 0; historia10[i]!= '\0'; i++){
            mvwprintw(win, (y / 2) + 3, x / 2 - (((strlen(historia10)) + 40) / 2) + 31 + i, "%c", historia10[i]);
            wrefresh(win);
            usleep(10000);
        }
        wattroff(win, COLOR_PAIR(2));

        wattron(win, COLOR_PAIR(2));
        for (int i = 0; historia11[i]!= '\0'; i++){
            mvwprintw(win, (y / 2) + 4, x / 2 - (((strlen(historia11)) + 1) / 2) + i, "%c", historia11[i]);
            wrefresh(win);
            usleep(10000);
        }
        wattroff(win, COLOR_PAIR(2));

        wattron(win, COLOR_PAIR(11));
        for (int i = 0; historia12[i]!= '\0'; i++){
            mvwprintw(win, (y / 2) + 4, x / 2 - (((strlen(historia12)) + 1) / 2) + 36 + i, "%c", historia12[i]);
            wrefresh(win);
            usleep(10000);
        }
        wattroff(win, COLOR_PAIR(11));

        wattron(win, COLOR_PAIR(2));
        for (int i = 0; historia13[i]!= '\0'; i++){
            mvwprintw(win, (y / 2) + 5, x / 2 - (((strlen(historia13)) + 1) / 2) + i, "%c", historia13[i]);
            wrefresh(win);
            usleep(10000);
        }
        wattroff(win, COLOR_PAIR(2));

        wattron(win, COLOR_PAIR(1));
        wattron(win, A_BOLD);
        for (int i = 0; historia5[i]!= '\0'; i++){
            mvwprintw(win, (y / 2) + 6, x / 2 - (((strlen(historia5)) + 160) / 2) + i, "%c", historia5[i]);
            wrefresh(win);
            usleep(10000);
        }
        wattroff(win, COLOR_PAIR(1));
        wattroff(win, A_BOLD); 

        wattron(win, COLOR_PAIR(2));
        for (int i = 0; historia15[i]!= '\0'; i++){
            mvwprintw(win, (y / 2) + 6, x / 2 - (((strlen(historia5)) + 160) / 2) + i + 5, "%c", historia15[i]);
            wrefresh(win);
            usleep(10000);
        }
        wattroff(win, COLOR_PAIR(2));

        wattron(win, COLOR_PAIR(2));
        wattron(win, A_DIM);
        wattron(win, A_BLINK);
        mvwprintw(win, (y / 2) + 8, x / 2 - ((strlen(historia14)) / 2), "%s", historia14);
        wattroff(win, A_BLINK);
        wattroff(win, A_DIM);
        wattroff(win, COLOR_PAIR(2));
        wrefresh(win);

        if (getch()) break;
    }

    endwin();

    return 0;
}