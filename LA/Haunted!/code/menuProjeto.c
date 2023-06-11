#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <curses.h>
#include <ncurses.h>
#include <locale.h>
#include <unistd.h>
#include <math.h>
#include <time.h>
#include "mapas.c"
#include "telaseparacao.c"
#include "info.c"

int main(){
    char *opcoes[] ={"Comecar", "Info","Sair"};
    int escolha = 0;
    int ch;

    initscr(); // inicializar a tela
    cbreak(); // desativar o buffering de entrada
    noecho(); // não mostrar as teclas digitadas na tela
    keypad(stdscr, TRUE); // ativar a leitura de teclas especiais (como as setas)
    start_color(); // ativar o color de saída

    init_pair(1, COLOR_RED, COLOR_BLACK);
    init_pair(2, COLOR_WHITE, COLOR_BLACK);

    wattrset(stdscr, COLOR_PAIR(1));
    
    int width, height;
    getmaxyx(stdscr, height, width);

    char nomeJogo_1[256] = "                                                                                              ,----,                                                  ,---,  \n";
    char nomeJogo_2[256] = "        ,--,                                                              ,--.              ,/   .`|                                               ,`--.' |  \n";
    char nomeJogo_3[256] = "      ,--.'|           ,---,                                            ,--.'|            ,`   .'  :            ,---,.            ,---,            |   :  :  \n";
    char nomeJogo_5[256] = "   ,--,  | :          '  .' \\                       ,--,            ,--,:  : |          ;    ;     /          ,'  .' |          .'  .' `\\          '   '  ;  \n";
    char nomeJogo_6[256] = ",---.'|  : '         /  ;    '.                   ,'_ /|         ,`--.'`|  ' :        .'___,/    ,'         ,---.'   |        ,---.'     \\         |   |  |  \n";
    char nomeJogo_7[256] = "|   | : _' |        :  :       \\             .--. |  | :         |   :  :  | |        |    :     |          |   |   .'        |   |  .`\\  |        '   :  ;  \n";
    char nomeJogo_8[256] = ":   : |.'  |        :  |   /\\   \\          ,'_ /| :  . |         :   |   \\ | :        ;    |.';  ;          :   :  |-,        :   : |  '  |        |   |  '  \n";
    char nomeJogo_9[256] = "|   ' '  ; :        |  :  ' ;.   :         |  ' | |  . .         |   : '  '; |        `----'  |  |          :   |  ;/|        |   ' '  ;  :        '   :  |  \n";
    char nomeJogo10[256] = "'   |  .'. |        |  |  ;/  \\   \\        |  | ' |  | |         '   ' ;.    ;            '   :  ;          |   :   .'        '   | ;  .  |        ;   |  ;  \n";
    char nomeJogo11[256] = "|   | :  | '        '  :  | \\  \\ ,'        :  | | :  ' ;         |   | | \\   |            |   |  '          |   |  |-,        |   | :  |  '        `---'. |  \n";
    char nomeJogo12[256] = "'   : |  : ;        |  |  '  '--'          |  ; ' |  | '         '   : |  ; .'            '   :  |          '   :  ;/|        '   : | /  ;          `--..`;  \n";
    char nomeJogo13[256] = "|   | '  ,/         |  :  :                :  | : ;  ; |         |   | '`--'              ;   |.'           |   |    \\        |   | '` ,/          .--,_     \n";
    char nomeJogo14[256] = ";   : ;--'          |  | ,'                '  :  `--'   \\        '   : |                  '---'             |   :   .'        ;   :  .'            |    |`.  \n";
    char nomeJogo15[256] = "|   ,/              `--''                  :  ,      .-./        ;   |.'                                    |   | ,'          |   ,.'              `-- -`, ; \n";
    char nomeJogo16[256] = "'---'                                       `--`----'            '---'                                      `----'            '---'                  '---`´  \n";

    int x = (width - strlen(nomeJogo_3)) / 2;
    int y = (height / 2) -10;
    
    while (1){
        clear(); // limpar a tela
        attron(A_BOLD);
        attron(COLOR_PAIR(1));
        mvprintw(y + 1, x, "%s\n", nomeJogo_1);
        mvprintw(y + 2, x, "%s\n", nomeJogo_2);
        mvprintw(y + 3, x, "%s\n", nomeJogo_3);
        mvprintw(y + 4, x, "%s\n", nomeJogo_5);
        mvprintw(y + 5, x, "%s\n", nomeJogo_6);
        mvprintw(y + 6, x, "%s\n", nomeJogo_7);
        mvprintw(y + 7, x, "%s\n", nomeJogo_8);
        mvprintw(y + 8, x, "%s\n", nomeJogo_9);
        mvprintw(y + 9, x, "%s\n", nomeJogo10);
        mvprintw(y + 10, x, "%s\n", nomeJogo11);
        mvprintw(y + 11, x, "%s\n", nomeJogo12);
        mvprintw(y + 12, x, "%s\n", nomeJogo13);
        mvprintw(y + 13, x, "%s\n", nomeJogo14);
        mvprintw(y + 14, x, "%s\n", nomeJogo15);
        mvprintw(y + 15, x, "%s\n", nomeJogo16);
        attroff(COLOR_PAIR(1));
        attroff(A_BOLD);

        for (int i = 0; i < 3; i++){
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
                escolha--;
                if (escolha < 0) {
                    escolha = 2;
                }
                break;
            case KEY_DOWN:
                escolha++;
                if (escolha > 2) {
                    escolha = 0;
                }
                break;
            case '\n':
                switch (escolha){
                    case 0:
                        clear();
                        TELADESEPARACAO();
                        game();

                        break;
                    case 1:
                        info();
                        break;
                    case 2:
                        endwin(); // desativar a biblioteca ncurses e encerrar o programa
                        return 0;
                        break;
                }
                break;
        }
    }

    return 0;
}
