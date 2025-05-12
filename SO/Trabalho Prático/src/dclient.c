#include "includes.h"

int main(int argc, char *argv[]) {

    // Verifica se o comando é -a
    if (strcmp(argv[1], "-a") == 0) {
        if (argc != 6) {
            printf("Use: %s -a \"title\" \"authors\" \"year\" \"path\"\n", argv[0]);
            return 1;
        }

        char msg[MAX_MSG_SIZE];

        // Construir a mensagem no formato: ADD|title|authors|year|path
        snprintf(msg, MAX_MSG_SIZE, "ADD|%s|%s|%s|%s:%d", argv[2], argv[3], argv[4], argv[5], getpid());

        // Abrir FIFO do servidor
        int fd = open(FIFO_PATH, O_WRONLY);
        if (fd < 0) {
            perror("Error opening server FIFO");
            return 1;
        }

        // Enviar mensagem
        if (write(fd, msg, strlen(msg) + 1) < 0) {
            perror("Error writing to FIFO");
            close(fd);
            return 1;
        }

        close(fd);

        // Agora lê a resposta do servidor (opcional)
        char resposta[2048];
        char client_fifo[64];
        snprintf(client_fifo, sizeof(client_fifo), "/tmp/client_fifo_%d", getpid());

        // Criar FIFO próprio para ler resposta
        mkfifo(client_fifo, 0666);

        // Abrir e ler resposta
        fd = open(client_fifo, O_RDONLY);
        if (fd >= 0) {
            read(fd, resposta, sizeof(resposta));
            printf("%s\n", resposta);
            close(fd);
        } else {
            perror("Error opening client response FIFO");
        }

        // Apagar FIFO
        unlink(client_fifo);
    }
    else if (strcmp(argv[1], "-c") == 0) {
        if (argc != 3) {
            printf("Use: %s -c \"key\"\n", argv[0]);
            return 1;
        }
    
        int doc_id = atoi(argv[2]);
        char msg[MAX_MSG_SIZE];
        snprintf(msg, MAX_MSG_SIZE, "CONSULT|%d:%d", doc_id, getpid());
    
        // Enviar para o servidor
        int fd = open(FIFO_PATH, O_WRONLY);
        if (fd < 0) {
            perror("Error opening server FIFO");
            return 1;
        }
    
        write(fd, msg, strlen(msg) + 1);
        close(fd);
    
        // Criar FIFO do cliente
        char client_fifo[64];
        snprintf(client_fifo, sizeof(client_fifo), "/tmp/client_fifo_%d", getpid());
        mkfifo(client_fifo, 0666);
    
        // Ler resposta
        fd = open(client_fifo, O_RDONLY);
        if (fd >= 0) {
            char resposta[2048];
            read(fd, resposta, sizeof(resposta));
            printf("%s\n", resposta);
            close(fd);
        } else {
            perror("Error opening response FIFO");
        }
    
        unlink(client_fifo);
    }
    else if (strcmp(argv[1], "-d") == 0) {
        if (argc != 3) {
            printf("Use: %s -d \"key\"\n", argv[0]);
            return 1;
        }
    
        int doc_id = atoi(argv[2]);
        char msg[MAX_MSG_SIZE];
        snprintf(msg, MAX_MSG_SIZE, "DELETE|%d:%d", doc_id, getpid());
    
        // Envia mensagem para o servidor
        int fd = open(FIFO_PATH, O_WRONLY);
        if (fd < 0) {
            perror("Error opening server FIFO");
            return 1;
        }
    
        write(fd, msg, strlen(msg) + 1);
        close(fd);
    
        // FIFO de resposta
        char client_fifo[64];
        snprintf(client_fifo, sizeof(client_fifo), "/tmp/client_fifo_%d", getpid());
        mkfifo(client_fifo, 0666);
    
        // Receber resposta
        fd = open(client_fifo, O_RDONLY);
        if (fd >= 0) {
            char resposta[2048];
            read(fd, resposta, sizeof(resposta));
            printf("%s\n", resposta);
            close(fd);
        } else {
            perror("Error opening response FIFO");
        }
    
        unlink(client_fifo);
    }
    else if (strcmp(argv[1], "-l") == 0) {
        if (argc != 4) {
            printf("Use: %s -l \"key\" \"keyword\"\n", argv[0]);
            return 1;
        }
    
        int doc_id = atoi(argv[2]);
        char *keyword = argv[3];
    
        char msg[MAX_MSG_SIZE];
        snprintf(msg, MAX_MSG_SIZE, "LINES|%d:%s:%d", doc_id, keyword, getpid());
    
        int fd = open(FIFO_PATH, O_WRONLY);
        if (fd < 0) {
            perror("Error opening server FIFO");
            return 1;
        }
    
        write(fd, msg, strlen(msg) + 1);
        close(fd);
    
        char client_fifo[64];
        snprintf(client_fifo, sizeof(client_fifo), "/tmp/client_fifo_%d", getpid());
        mkfifo(client_fifo, 0666);
    
        fd = open(client_fifo, O_RDONLY);
        if (fd >= 0) {
            char resposta[2048];
            read(fd, resposta, sizeof(resposta));
            printf("%s\n", resposta);
            close(fd);
        } else {
            perror("Error opening response FIFO");
        }
    
        unlink(client_fifo);
    }
    else if (strcmp(argv[1], "-s") == 0) {
        char msg[MAX_MSG_SIZE];
    
        if (argc == 3) {
            // Pesquisa simples
            char *keyword = argv[2];
            snprintf(msg, MAX_MSG_SIZE, "SEARCH|%s:%d", keyword, getpid());
        } else if (argc == 4) {
            // Pesquisa concorrente
            char *keyword = argv[2];
            int n_processes = atoi(argv[3]);
            snprintf(msg, MAX_MSG_SIZE, "SEARCH_PAR|%s:%d:%d", keyword, n_processes, getpid());
        } else {
            printf("Use:\n");
            printf("  %s -s \"keyword\"\n", argv[0]);
            printf("  %s -s \"keyword\" \"num_processes\"\n", argv[0]);
            return 1;
        }
    
        // Enviar mensagem
        int fd = open(FIFO_PATH, O_WRONLY);
        if (fd < 0) {
            perror("Error opening server FIFO");
            return 1;
        }
    
        write(fd, msg, strlen(msg) + 1);
        close(fd);
    
        // Criar FIFO de resposta
        char client_fifo[64];
        snprintf(client_fifo, sizeof(client_fifo), "/tmp/client_fifo_%d", getpid());
        mkfifo(client_fifo, 0666);
    
        // Ler resposta
        fd = open(client_fifo, O_RDONLY);
        if (fd >= 0) {
            char resposta[2048];
            read(fd, resposta, sizeof(resposta));
            printf("%s\n", resposta);
            close(fd);
        } else {
            perror("Error opening response FIFO");
        }
    
        unlink(client_fifo);
    }
    else if (strcmp(argv[1], "-f") == 0) {
        char msg[MAX_MSG_SIZE];
        snprintf(msg, MAX_MSG_SIZE, "SHUTDOWN|%d", getpid());
    
        int fd = open(FIFO_PATH, O_WRONLY);
        if (fd < 0) {
            perror("Error opening server FIFO");
            return 1;
        }
    
        write(fd, msg, strlen(msg) + 1);
        close(fd);
    
        // Criar FIFO para resposta
        char client_fifo[64];
        snprintf(client_fifo, sizeof(client_fifo), "/tmp/client_fifo_%d", getpid());
        mkfifo(client_fifo, 0666);
    
        fd = open(client_fifo, O_RDONLY);
        if (fd >= 0) {
            char resposta[128];
            read(fd, resposta, sizeof(resposta));
            printf("%s\n", resposta);
            close(fd);
        } else {
            perror("Error opening response FIFO");
        }
    
        unlink(client_fifo);
    }    

    return 0;
}