CC = gcc
CFLAGS = -Wall -Wextra -pedantic -O2
LIBS = -lm -lcurses

all: jogo
	./jogo

jogo: menuProjeto.o
	$(CC) $(CFLAGS) menuProjeto.o -o jogo $(LIBS)

menuProjeto.o: menuProjeto.c mapas.o telaseparacao.o info.o
	$(CC) $(CFLAGS) -c menuProjeto.c

mapas.o: mapas.c youdied.o uwin.o
	$(CC) $(CFLAGS) -c mapas.c

youdied.o: youdied.c
	$(CC) $(CFLAGS) -c youdied.c

uwin.o: uwin.c
	$(CC) $(CFLAGS) -c uwin.c

telaseparacao.o: telaseparacao.c 
	$(CC) $(CFLAGS) -c telaseparacao.c

info.o: info.c 
	$(CC) $(CFLAGS) -c info.c

clean:
	rm -f jogo *.o
