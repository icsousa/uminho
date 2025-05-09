#include <stdlib.h>
#include <stdio.h>

typedef struct lligada {
    int valor;
    struct lligada *prox;
} *LInt;

int lenght(LInt l) {
    int tamanho = 0;
    while(l) {
        tamanho++;
        l = l->prox;
    }

    return tamanho;
}

void freeL(LInt l) {
    LInt temp;
    while(l != NULL) {
        temp = l;
        l = l->prox;
        free(temp);
    }
}

void imprimeL(LInt l) {
    while(l != NULL) {
        printf("%d\n", l->valor);
        l = l->prox;
    }
}

LInt reverseL(LInt l) {
    LInt prev = NULL, next = NULL;
    while(l != NULL) {
        next = l->prox;
        l->prox = prev;
        prev = l;
        l = next;
    }

    return prev;
}

void insertOrd(LInt *l, int x) {
    LInt novo = malloc(sizeof(struct lligada));
    novo->valor = x;

    while(*l != NULL && (*l)->valor < x) {
        l = &((*l)->prox);
    }

    novo->prox = *l;
    *l = novo;
}

int removeOneOrd(LInt *l, int x) {
    while(*l != NULL && (*l)->valor != x) {
        l = &((*l)->prox);
    }

    if (*l == NULL) return 1;

    LInt temp = *l;
    *l = (*l)->prox;
    free(temp);
    return 0;
}

void merge(LInt *r, LInt a, LInt b) {
    while (a && b) {
        if (a->valor < b->valor) {
            *r = a;
            a = a->prox;
        }
        else {
            *r = b;
            b = b->prox;
        }
        r = &((*r)->prox);
    }
    *r = (a) ? a : b;
}

void splitQS(LInt l, int x, LInt *mx, LInt *Mx) {
    *mx = *Mx = NULL;
    LInt *pmx = mx, *pMx = Mx;
    while(l) {
        if (l->valor < x) {
            *pmx = l;
            pmx = &((*pmx)->prox);
        }
        else {
            *pMx = l;
            pMx = &((*pMx)->prox);
        }
        l = l->prox;
    }
    *pmx = *pMx = NULL;
}

LInt parteAmeio(LInt *l) {
    int len = 0;
    LInt p = *l;
    for (;p;p->prox) len++;

    int meio = len / 2;
    if (meio == 0) return NULL;

    LInt ant = NULL, curr = *l;
    for (int i = 0; i < meio; i++) {
        ant = curr;
        curr = curr->prox;
    }

    if (ant) ant->prox = NULL;

    LInt res = *l;
    *l = curr;
    return res;
}

int removeAll(LInt *l, int x) {
    int count = 0;
    while(*l) {
        if ((*l)->valor == x) {
            LInt temp = *l;
            *l = (*l)->prox;
            free(temp);
            count++;
        }
        else {
            l = &((*l)->prox);
        }
    }
    return count;
}

int removeDups(LInt *l) {
    int count = 0;
    for (;*l;l=&((*l)->prox)) {
        LInt *p = &((*l)->prox);
        while(*p) {
            if ((*p)->valor == (*l)->valor) {
                LInt temp = *p;
                *p = (*p)->prox;
                free(temp);
                count++;
            }
            else {
                p = &((*p)->prox);
            }
        }
    }
    return count;
}

int removeMaiorL(LInt *l) {
    LInt *max = l;
    for (LInt *p = l; *p; p = &((*p)->prox)) {
        if((*p)->valor > (*max)->valor) max = p;
    }

    int val = (*max)->valor;
    LInt temp = *max;
    *max = (*max)->prox;
    free(temp);
    return val;
}

void init (LInt *l) {
    if(*l == NULL) return;
    if((*l)->prox == NULL) {
        free(*l);
        *l = NULL;
        return;
    } 

    while((*l)->prox->prox) {
        l = &((*l)->prox);
    }

    free((*l)->prox);
    (*l)->prox = NULL;
}

void appendL(LInt *l, int x) {
    while(*l) l = &((*l)->prox);
    *l = malloc(sizeof(lligada));
    (*l)->valor = x;
    (*l)->prox = NULL;
}

void concatL(LInt *a, LInt b) {
    while(*a) a = &((*a)->prox);
    *a = b;
}

LInt cloneL(LInt l) {
    LInt r = NULL, *tail = &r;
    while(l) {
        *tail = malloc(sizeof(lligada));
        (*tail)->valor = l->valor;
        tail = &((*tail)->prox);
        l = l->prox;
    }
    *tail = NULL;
    return r;
}

LInt cloneRev(LInt l) {
    LInt r = NULL, temp;
    while(l) {
        temp = malloc(sizeof(lligada));
        temp->valor = l->valor;
        temp->prox = r;
        r = temp;
        l = l->prox;
    }
    return r;
}

int maximo(LInt l) {
    int max = l->valor;
    while(l) {
        if(max < l->valor) max = l->valor;
        l = l->prox;
    }
    return max;
}

int take(int n, LInt *l) {
    int count = 0;
    while(*l && n > 1) {
        l = &((*l)->prox);
        n--;
        count++;
    }

    if(*l) {
        freeL((*l)->prox);
        (*l)->prox = NULL;
        count++;
    }
    return count;
}

int drop(int n, LInt *l) {
    int count = 0;
    while(*l && n > 0) {
        LInt temp = *l;
        *l = (*l)->prox;
        free(temp);
        n--;
        count++;
    }
    return count;
}

LInt Nforward(LInt l, int N) {
    for(;N-1 > 0; N--) l = l->prox;
    return l;
}

int listToArray(LInt l, int v[], int N) {
    for(int i = 0; l && i < N; i++) {
        v[i] = l->valor;
        l = l->prox;
    }
}

LInt arrayToList(int v[], int N) {
    LInt r = NULL, *tail = &r;
    for(int i = 0; i < N, i++) {
        *tail = malloc(sizeof(lligada));
        (*tail)->valor = v[i];
        tail = &((*tail)->prox);
    }

    *tail = NULL;
    return r;
}

LInt somasAcl(LInt l) {
    int soma = 0;
    LInt r = NULL, *tail = &r;
    while(l) {
        soma += l->valor;
        *tail = malloc(sizeof(lligada));
        (*tail)->valor = soma;
        tail = &((*tail)->prox);
        l = l->prox;
    }

    *tail = NULL;
    return r;
}

void remreps(LInt l) {
    while(l && l->prox) {
        if(l->valor == l->prox->valor) {
            LInt temp = l->prox;
            l->prox = temp_prox;
            free(temp);
        }
        else {
            l = l->prox;
        }
    }
}

LInt rotateL(LInt l) {
    if(!l || !l->prox) return l;

    LInt head = l;
    l = l->prox;
    LInt *tail = &l;
    while((*tail)->prox) tail = &((*tail)->prox);
    (*tail)->prox = head;
    head->prox = NULL;
    return l;
}

LInt parte(LInt l) {
    if(!l) return NULL;

    LInt pares = l->prox;
    LInt *impar = &l, *par = &pares;

    while(*par && (*par)->prox) {
        (*impar)->prox = (*par)->prox;
        impar = &((*impar)->prox);
        *par = (*par)->prox->prox;
    }

    (*impar)->prox = NULL;
    return pares;
}

typedef struct nodo {
    int valor;
    struct nodo *esq, *dir;
} *ABin;

int altura(ABin a) {
    if(!a) return 0;
    int e = altura(a->esq);
    int d = altura(a->dir);

    return 1 + (e > d ? e : d);
}

ABin cloneAB(ABin a) {
    if(!a) return NULL;
    ABin r = malloc(sizeof(struct nodo));
    r->valor = a->valor;
    r->esq = cloneAB(a->esq);
    r->dir = cloneAB(a->dir);
    return r;
}

void mirror(ABin *a) {
    if(*a) {
        mirror(&((*a)->esq));
        mirror(&((*a)->dir));
        ABin tmp = (*a)->esq;
        (*a)->esq = (*a)->dir;
        (*a)->dir = tmp;
    }
}

void inorder(ABin a, LInt *l) {
    if(!a) return;

    inorder(a->esq, l);
    *l = malloc(sizeof(struct lligada));
    (*l)->valor = a->valor;
    l = &((*l)->prox);

    inorder(a->dir, l);
    *l = NULL;
}

void preorder(ABin a, LInt *l) {
    if(!a) return;

    *l = malloc(sizeof(struct lligada));
    (*l)->valor = a->valor;
    l = &((*l)->prox);

    preorder(a->esq, l);
    preorder(a->dir, l);

    *l = NULL;
}

void posorder(ABin a, LInt *l) {
    if(!a) return;

    posorder(a->esq, l);
    posorder(a->dir, l);

    *l = malloc(sizeof(struct lligada));
    (*l)->valor = a->valor;
    l = &((*l)->prox);
    *l = NULL;
}

int depth(ABin a, int x) {
    if(!a) return -1;

    if(a->valor == x) return 1;

    int e = depth(a->esq, x);
    int d = depth(a->dir, x);
    if(e != -1) return 1 + e;
    if(d != -1) return 1 + d;

    return -1;
}

int freeAB(ABin a) {
    if(!a) return 0;

    int e = freeAB(a->esq);
    int d = freeAB(a->dir);
    free(a);

    return 1 + e + d;
}

int pruneAB(ABin *a, int l) {
    if(!*a) return 0;
    if(l <= 0) {
        int count = freeAB(*a);
        *a = NULL;
        return count;
    }

    int e = pruneAB(&((*a)->esq), l - 1);
    int d = pruneAB(&((*a)->dir), l - 1);

    return e + d;
}

int iguaisAB(ABin a, ABin b) {
    if(!a && !b) return 1;
    if(!a || !b) return 0;

    return (a->valor == b->valor && iguaisAB(a->esq, b->esq) && iguaisAB(a->dir, b->dir));
}

LInt nivelL(ABin a, int n) {
    if(!a || n < 1) return NULL;
    if(n == 1) {
        LInt r = malloc(sizeof(struct lligada));
        r->valor = a->valor;
        r->prox = NULL;
        return r;
    }

    LInt e = nivelL(a->esq, n - 1);
    LInt d = nivelL(a->dir, n - 1);

    LInt *p = &e;
    while(*p) p = &((*p)->prox);

    *p = d;

    return e;
}

int nivelV(ABin a, int n, int v[]) {
    if(!a || n < 1) return 0;
    if(n == 1) {
        v[0] = a->valor;
        return 1;
    }

    int i = nivelV(a->esq, n - 1, v);
    return i + nivelV(a->dir, n - 1, v + i);
}

int dumpAbin(ABin a, int v[], int N) {
    if(!a || N == 0) return 0;

    int i = dumpAbin(a->esq, v, N);
    if(i < N) {
        v[i++] = a->valor;
    }
    return i + dumpAbin(a->dir, v + i, N - i);
}

int somaSub(ABin a) {
    if (!a) return 0;
    return a->valor + somaSub(a->esq) + somaSub(a->dir);
}

ABin somasAcA(ABin a) {
    if(!a) return NULL;

    ABin r = malloc(sizeof(struct nodo));

    r->valor = somaSub(a);
    r->esq = somasAcA(a->esq);
    r->dir = somasAcA(a->dir);

    return r;
}

int contaFolhas(ABin a) {
    if(!a) return 0;
    if(!a->esq && !a->dir) return 1;
    return contaFolhas(a->esq) + contaFolhas(a->dir);
}

ABin cloneMirror(ABin a) {
    if(!a) return NULL;

    ABin r = malloc(sizeof(struct nodo));

    r->valor = a->valor;
    r->esq = cloneMirror(a->dir);
    r->dir = cloneMirror(a->esq);

    return r;
}

int addOrd(ABin *a, int x) {
    while(*a) {
        if((*a)->valor == x) return 1;
        if(x < (*a)->valor) a = &((*a)->esq);
        else a = &((*a)->dir);
    }

    *a = malloc(sizeof(struct nodo));

    (*a)->valor = x;
    (*a)->esq = (*a)->dir = NULL;
    return 0;
}

int lookupAB(ABin a, int x) {
    while(a) {
        if(a->valor == x) return 1;
        if(x < a->valor) a = a->esq;
        else a = a->dir;
    }

    return 0;
}

int depthOrd(ABin a, int x) {
    int d = 1;
    while(a) {
        if(a->valor == x) return d;
        if(x < a->valor) a = a->esq;
        else a = a->dir;
        d++;
    }

    return -1;
}

int maiorAB(ABin a) {
    while(a->dir) a = a->dir;
    return a->valor;
}

void removeMaiorA(ABin *a) {
    while((*a)->dir) a = &((*a)->dir);

    ABin temp = *a;
    *a = (*a)->esq;
    free(temp);
}

int quantosMaiores(ABin a, int x) {
    if(!a) return 0;
    if(a->valor <= x) return quantosMaiores(a->dir, x);
    return 1 + quantosMaiores(a->esq, x) + quantosMaiores(a->dir, x);
}

void listToBTree(LInt l, ABin *a) {
    *a = NULL;
    while(l) {
        addOrd(a, l->valor);
        l = l->prox;
    }
}

int isBST(ABin a, int *min, int *max) {
    if(!a) return 1;
    int lmin, lmax, rmin, rmax;
    if(a->esq) {
        if (!isBST(a->esq, &lmin, &lmax) || lmax >= a->valor) return 0;
    } 
    else lmin = a->valor;

    if (a->dir) {
        if (!isBST(a->dir, &rmin, &rmax) || rmin <= a->valor) return 0;
    } 
    else rmax = a->valor;

    *min = (a->esq) ? lmin : a->valor;
    *max = (a->dir) ? rmax : a->valor;
    return 1;
}

int deProcura(ABin a) {
    int min, max;
    return isBST(a, &min, &max);
}