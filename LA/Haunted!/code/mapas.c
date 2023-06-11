#include <curses.h>
#include <ncurses.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <math.h>
#include <locale.h>
#include <unistd.h>
#include <stdbool.h>
#include "uwin.c"
#include "youdied.c"

#define PI 3.14159265

int game(){
    initscr();
    keypad(stdscr, TRUE); //ative a captura das teclas de setas
    noecho(); //desative o eco das teclas pressionadas
    curs_set(0);
    start_color();

    init_pair(1, COLOR_RED, COLOR_BLACK);
    init_pair(3, COLOR_GREEN, COLOR_BLACK);
    init_pair(2, COLOR_WHITE, COLOR_BLACK);
    init_pair(5, COLOR_YELLOW, COLOR_BLACK);
    init_pair(4, COLOR_BLACK, COLOR_BLACK);
    init_pair(6, COLOR_MAGENTA, COLOR_WHITE);
    init_pair(7, COLOR_WHITE, COLOR_WHITE);
    init_pair(8, COLOR_BLACK, COLOR_WHITE);
    init_pair(9, COLOR_GREEN, COLOR_WHITE);
    init_pair(10, COLOR_RED, COLOR_WHITE);
    init_pair(11, COLOR_CYAN, COLOR_BLACK);

    int width, height;
    getmaxyx(stdscr, width, height);

    int start_y = (width - 50) / 2;  
    int start_x = (height - 200) / 2;  
    int end_y = start_y + 50;
    int end_x = start_x + 200;

    attron(A_DIM);
    attron(COLOR_PAIR(2));

    int x, y;

    //random
    srand(time(NULL));

    //desenhar as bordas do retângulo
    for (y = start_y; y < end_y; y++){
        int randomBorder = (int)rand() % 2; 
        if (randomBorder == 0){
            mvaddch(y, start_x, '#');
            mvaddch(y, start_x - 1, '#');
            mvaddch(y, end_x - 1, '#');
            mvaddch(y, end_x - 2, '#');
        }
        else {
            mvaddch(y, start_x, '#');
            mvaddch(y, start_x + 1, '#');
            mvaddch(y, end_x - 2, '#');
            mvaddch(y, end_x - 3, '#');
        }
    }

    for (x = start_x; x < end_x; x++){
        int randomBorder = (int)rand() % 2; 
        if (randomBorder == 0){
            mvaddch(start_y, x, '#');
            mvaddch(end_y, x, '#');
        }
        else {
            mvaddch(start_y - 1, x, '#');
            mvaddch(end_y - 1, x, '#');
        }
    }

    attroff(COLOR_PAIR(2));

    refresh();

    //add pedras e arvores
    int numero = (end_x - start_x - 3) - 2 * (end_y - start_y - 3) - 2;
    int pedra_count = numero;
    int arvore_count = numero / 3;

    while (pedra_count > 0 || arvore_count > 0){
        int x = rand() % (end_x - start_x - 5) + start_x + 2;
        int y = rand() % (end_y - start_y - 5) + start_y + 2;
        int size_x = rand() % 3 + 2;
        int size_y = rand() % 3 + 2;

        if (pedra_count > 0 && rand() % 5 == 0){
            attron(COLOR_PAIR(2));
            for (int dy = 0; dy < size_y; dy++){
                for (int dx = 0; dx < size_x; dx++){
                    if (rand() % 2 == 0){
                        mvaddch(y + dy, x + dx, 'P');
                    }
                }
            }
            pedra_count--;
            attroff(COLOR_PAIR(2));

        } else if (arvore_count > 0 && rand() % 5 == 0){
            attron(COLOR_PAIR(3));
            int rock_size_x = rand() % 3 + 3;
            int rock_size_y = rand() % 3 + 3;
            for (int dy = 0; dy < rock_size_y; dy++){
                for (int dx = 0; dx < rock_size_x; dx++){
                    mvaddch(y + dy, x + dx, 'A');
                }
            }
            arvore_count--;
            attroff(COLOR_PAIR(3));
        }
    }
    attroff(A_DIM);

    int player_y = width / 2;
    int player_x = height / 2;

    int new_y = player_y;
    int new_x = player_x;

    attron(A_BOLD);
    mvaddch(player_y, player_x, '@');
    attroff(A_BOLD);

    int vision_radius = 21;

    refresh();

    int health = 100;
    int newHealth = health;

    int monster_y = 0, monster_x = 0;
    bool isMonsterActive = false; 

    time_t inicio = time(NULL);

    int monstercount = 0;

    int cura_y = rand() % (end_y - start_y - 5) + start_y + 2;
    int cura_x = rand() % (end_x - start_x - 5) + start_x + 2;

    while (difftime(time(NULL), inicio) <= 23400){
        attron(COLOR_PAIR(2));
        attron(A_DIM);
        attron(A_STANDOUT);
        mvprintw(1, 100,"           ");
        time_t atual = time(NULL);
        double segundos = difftime(atual, inicio);
        int horas = segundos / 3600;
        int minutos = (segundos - (horas * 3600)) / 60;
        int segundos_restantes = segundos - (horas * 3600) - (minutos * 60);
        mvprintw(1, 100,"%02d:%02d:%02d AM", horas, minutos, segundos_restantes);
        refresh();
        attroff(COLOR_PAIR(2));
        attroff(A_DIM);
        attroff(A_STANDOUT);
        
        attron(A_DIM);
        mvprintw(1, start_x, ">>");
        attroff(A_DIM);

        attron(A_BLINK);
        attron(COLOR_PAIR(2));
        mvprintw(1, start_x + 3, "pressiona (ESC) para voltar ao Menu");
        attroff(COLOR_PAIR(2));
        
        attroff(A_BLINK);

        if (health != newHealth){
            attron(A_REVERSE);
            attron(A_BLINK);
            attron(COLOR_PAIR(1));
            mvprintw(end_y + 1, start_x, "Vida: %d%%\n", newHealth);
            attroff(COLOR_PAIR(1));
            attroff(A_BLINK);
            attroff(A_REVERSE);
            health = newHealth;
        }
        else {
            attron(COLOR_PAIR(1));
            mvprintw(end_y + 1, start_x, "Vida: %d%%\n", health);
            attroff(COLOR_PAIR(1));
        }

        int ch = getch();

        attron(A_DIM);
        mvaddch(player_y, player_x, ' ');
        for (int angle = 0; angle < 360; angle++){
            float radians = angle * (PI / 180.0);
            for (int radius = 1; radius <= vision_radius; radius++){
                int cell_y = player_y + radius * sin(radians);
                int cell_x = player_x + radius * cos(radians);

                if (cell_y >= start_y && cell_y < end_y && cell_x >= start_x && cell_x < end_x){
                    char cell_char = mvinch(cell_y, cell_x) & A_CHARTEXT;
                    bool cell_visible = (cell_char != '#' && cell_char != 'A' && cell_char != 'P');
                    if (cell_visible){
                        mvaddch(cell_y, cell_x, ' ');
                    }
                }
                else {
                    break;  //A célula está fora dos limites da janela, interrompe o desenho
                }
            }
        }
        refresh();

        attroff(A_DIM);
        attron(A_BOLD);
        switch (ch){
            case KEY_UP:
                new_y--; //quando clica na tecla moda as proximas coordenadas

                if ((mvinch(new_y, new_x) & A_CHARTEXT) != '#' && (mvinch(new_y, new_x)  & A_CHARTEXT)!= 'A' && (mvinch(new_y, new_x) & A_CHARTEXT) != 'P'){
                    mvaddch(new_y, new_x, '@');
                    player_y = new_y;
                    player_x = new_x;
                }
                else {
                    mvaddch(player_y, player_x, '@');
                    new_y++;
                }

                break;
            case KEY_DOWN:
                new_y++; //quando clica na tecla moda as proximas coordenadas
                
                if ((mvinch(new_y, new_x) & A_CHARTEXT) != '#' && (mvinch(new_y, new_x)  & A_CHARTEXT)!= 'A' && (mvinch(new_y, new_x) & A_CHARTEXT) != 'P'){
                    mvaddch(new_y, new_x, '@');
                    player_y = new_y;
                    player_x = new_x;
                }
                else {
                    mvaddch(player_y, player_x, '@');
                    new_y--;
                }

                break;
            case KEY_LEFT:
                new_x--; //quando clica na tecla moda as proximas coordenadas
                
                if ((mvinch(new_y, new_x) & A_CHARTEXT) != '#' && (mvinch(new_y, new_x)  & A_CHARTEXT)!= 'A' && (mvinch(new_y, new_x) & A_CHARTEXT) != 'P'){
                    mvaddch(new_y, new_x, '@');
                    player_y = new_y;
                    player_x = new_x;
                }
                else {
                    mvaddch(player_y, player_x, '@');
                    new_x++;
                }

                break;
            case KEY_RIGHT:
                new_x++; //quando clica na tecla moda as proximas coordenadas
                
                if ((mvinch(new_y, new_x) & A_CHARTEXT) != '#' && (mvinch(new_y, new_x)  & A_CHARTEXT)!= 'A' && (mvinch(new_y, new_x) & A_CHARTEXT) != 'P'){
                    mvaddch(new_y, new_x, '@');
                    player_y = new_y;
                    player_x = new_x;
                }
                else {
                    mvaddch(player_y, player_x, '@');
                    new_x--;
                }

                break;
            case '1':
                    // Verificar se o monstro está dentro do raio de visão
                if (monster_y >= player_y - vision_radius && monster_y <= player_y + vision_radius && monster_x >= player_x - vision_radius && monster_x <= player_x + vision_radius) {
                    // Verificar se o monstro está em uma posição marcada por '.'
                    mvaddch(monster_y, monster_x, 'X');
                    isMonsterActive = false;
                    monstercount++;
                }
                break;
            case 27:
                endwin();
                return 0;
                break;     
        }
        refresh();
        
        attroff(A_BOLD);

        attron(A_DIM);
        for (int angle = 0; angle < 360; angle++){
            float radians = angle * (PI / 180.0);
            for (int radius = 1; radius <= vision_radius; radius++){
                int cell_y = player_y + radius * sin(radians);
                int cell_x = player_x + radius * cos(radians);
                if ((mvinch(cell_y, cell_x) & A_CHARTEXT) == '#' || (mvinch(cell_y, cell_x) & A_CHARTEXT) == 'A' || (mvinch(cell_y, cell_x) & A_CHARTEXT) == 'P'){
                    break;
                }

                if (cell_y >= start_y && cell_y < end_y && cell_x >= start_x && cell_x < end_x){
                    char cell_char = mvinch(cell_y, cell_x) & A_CHARTEXT;
                    bool cell_visible = (cell_char != '#' && cell_char != 'A' && cell_char != 'P');
                    if (cell_visible){
                        attron(COLOR_PAIR(5));
                        mvaddch(cell_y, cell_x, '.');
                        attroff(A_DIM);
                        attroff(COLOR_PAIR(5));
                        attron(A_BOLD);
                        mvaddch(player_y, player_x, '@');
                        attroff(A_BOLD);
                    }
                }
            }
        }

        int randomMonster = 0;

        if(!isMonsterActive){
            randomMonster = (int)rand() % 2;
        } 

        if (randomMonster == 0){
            if (!isMonsterActive && (mvinch(monster_y, monster_x) & A_CHARTEXT) == 'X'){
                isMonsterActive = true;
                attron(COLOR_PAIR(1));
                attron(A_BOLD);
                mvaddch(monster_y, monster_x, 'M');
                attroff(COLOR_PAIR(1));
                attroff(A_BOLD);
            }

            if (!isMonsterActive) {
                monster_y = rand() % (end_y - start_y - 5) + start_y + 2;
                monster_x = rand() % (end_x - start_x - 5) + start_x + 2;


                if ((mvinch(monster_y, monster_x) & A_CHARTEXT) != '#' && (mvinch(monster_y, monster_x) & A_CHARTEXT) != 'A' && (mvinch(monster_y, monster_x) & A_CHARTEXT) != 'P') {
                    mvaddch(monster_y, monster_x, 'M'); //Desenhe o monstro na posição aleatória
                    isMonsterActive = true; //Ative o monstro
                }
            }

            if (isMonsterActive) {
            //Lógica para determinar a direção do movimento do monstro
            int move_y = 0, move_x = 0;

                if (player_y < monster_y && (mvinch(monster_y - 1, monster_x) & A_CHARTEXT) != '#' && (mvinch(monster_y - 1, monster_x) & A_CHARTEXT) != 'A' && (mvinch(monster_y - 1, monster_x) & A_CHARTEXT) != 'P') {
                    move_y = -1; //Mova para cima
                } else if (player_y > monster_y && (mvinch(monster_y + 1, monster_x) & A_CHARTEXT) != '#' && (mvinch(monster_y + 1, monster_x) & A_CHARTEXT) != 'A' && (mvinch(monster_y + 1, monster_x) & A_CHARTEXT) != 'P') {
                    move_y = 1; //Mova para baixo
                }

                if (player_x < monster_x && (mvinch(monster_y, monster_x - 1) & A_CHARTEXT) != '#' && (mvinch(monster_y, monster_x - 1) & A_CHARTEXT) != 'A' && (mvinch(monster_y, monster_x - 1) & A_CHARTEXT) != 'P') {
                    move_x = -1; //Mova para a esquerda
                } else if (player_x > monster_x && (mvinch(monster_y, monster_x + 1) & A_CHARTEXT) != '#' && (mvinch(monster_y, monster_x + 1) & A_CHARTEXT) != 'A' && (mvinch(monster_y, monster_x + 1) & A_CHARTEXT) != 'P') {
                    move_x = 1; //Mova para a direita
                }

                //Atualize a posição do monstro
                monster_y += move_y;
                monster_x += move_x;

                //Limpe a posição anterior do monstro
                mvaddch(monster_y - move_y, monster_x - move_x, ' ');

                //Verifique se o monstro alcançou o jogador
                if (monster_y == player_y && monster_x == player_x) {
                    newHealth -= 20;
                    if(newHealth == 0){ 
                    clear();
                    break;
                    }
                }

                //Desenhe o monstro na nova posição
                attron(COLOR_PAIR(1));
                attron(A_BOLD);
                mvaddch(monster_y, monster_x, 'M');
                attroff(COLOR_PAIR(1));
                attroff(A_BOLD);
            }
            refresh();
        }
        else {
            if (!isMonsterActive && (mvinch(monster_y, monster_x) & A_CHARTEXT) == 'X'){
                isMonsterActive = true;
                attron(COLOR_PAIR(1));
                attron(A_BOLD);
                mvaddch(monster_y, monster_x, 'E');
                attroff(COLOR_PAIR(1));
                attroff(A_BOLD);
            }

            if (!isMonsterActive) {
                monster_y = rand() % (end_y - start_y - 5) + start_y + 2;
                monster_x = rand() % (end_x - start_x - 5) + start_x + 2;


                if ((mvinch(monster_y, monster_x) & A_CHARTEXT) != '#' && (mvinch(monster_y, monster_x) & A_CHARTEXT) != 'A' && (mvinch(monster_y, monster_x) & A_CHARTEXT) != 'P') {
                    mvaddch(monster_y, monster_x, 'E'); //Desenhe o monstro na posição aleatória
                    isMonsterActive = true; //Ative o monstro
                }
            }

            if (isMonsterActive) {
            //Lógica para determinar a direção do movimento do monstro
            int move_y = 0, move_x = 0;

                if (player_y < monster_y && (mvinch(monster_y - 1, monster_x) & A_CHARTEXT) != '#' && (mvinch(monster_y - 1, monster_x) & A_CHARTEXT) != 'A' && (mvinch(monster_y - 1, monster_x) & A_CHARTEXT) != 'P') {
                    move_y = -1; //Mova para cima
                } else if (player_y > monster_y && (mvinch(monster_y + 1, monster_x) & A_CHARTEXT) != '#' && (mvinch(monster_y + 1, monster_x) & A_CHARTEXT) != 'A' && (mvinch(monster_y + 1, monster_x) & A_CHARTEXT) != 'P') {
                    move_y = 1; //Mova para baixo
                }

                if (player_x < monster_x && (mvinch(monster_y, monster_x - 1) & A_CHARTEXT) != '#' && (mvinch(monster_y, monster_x - 1) & A_CHARTEXT) != 'A' && (mvinch(monster_y, monster_x - 1) & A_CHARTEXT) != 'P') {
                    move_x = -1; //Mova para a esquerda
                } else if (player_x > monster_x && (mvinch(monster_y, monster_x + 1) & A_CHARTEXT) != '#' && (mvinch(monster_y, monster_x + 1) & A_CHARTEXT) != 'A' && (mvinch(monster_y, monster_x + 1) & A_CHARTEXT) != 'P') {
                    move_x = 1; //Mova para a direita
                }

                //Atualize a posição do monstro
                monster_y += move_y;
                monster_x += move_x;

                //Limpe a posição anterior do monstro
                mvaddch(monster_y - move_y, monster_x - move_x, ' ');

                //Verifique se o monstro alcançou o jogador
                if (abs(monster_y - player_y) < 6 && abs(monster_x - player_x) < 6) {
                    if ((mvinch(monster_y, monster_x - 1) & A_CHARTEXT) != '#' && (mvinch(monster_y, monster_x - 1) & A_CHARTEXT) != 'A' && (mvinch(monster_y, monster_x - 1) & A_CHARTEXT) != 'P' && (mvinch(monster_y, monster_x + 1) & A_CHARTEXT) != '#' && (mvinch(monster_y, monster_x + 1) & A_CHARTEXT) != 'A' && (mvinch(monster_y, monster_x + 1) & A_CHARTEXT) != 'P' && (mvinch(monster_y + 1, monster_x) & A_CHARTEXT) != '#' && (mvinch(monster_y + 1, monster_x) & A_CHARTEXT) != 'A' && (mvinch(monster_y + 1, monster_x) & A_CHARTEXT) != 'P' && (mvinch(monster_y - 1, monster_x) & A_CHARTEXT) != '#' && (mvinch(monster_y - 1, monster_x) & A_CHARTEXT) != 'A' && (mvinch(monster_y - 1, monster_x) & A_CHARTEXT) != 'P'){
                        newHealth -= 12;
                        if(newHealth <= 0){ 
                        clear();
                        break;
                        }
                    }
                }

                //Desenhe o monstro na nova posição
                attron(COLOR_PAIR(1));
                attron(A_BOLD);
                mvaddch(monster_y, monster_x, 'E');
                attroff(COLOR_PAIR(1));
                attroff(A_BOLD);
            }
            refresh();            
        }

        refresh();

        if (monstercount >= 21){
            attron(COLOR_PAIR(6));
            attron(A_STANDOUT);
            attron(A_BLINK);
            mvaddch(cura_y, cura_x, 'C');
            attroff(A_BLINK);
            attroff(COLOR_PAIR(6));
            attroff(A_STANDOUT);
        }

        if ((mvinch(player_y, player_x) & A_CHARTEXT) == 'C'){ 
            WIN();
            endwin();
            return 0;
        }
    }
    MORTO();
    endwin();

    return 0;
}