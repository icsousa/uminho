package model;

import java.io.Serializable;
import java.util.*;

/**
 * Classe abstrata que representa um plano de subscrição.
 * Cada plano define como os pontos são atribuídos ao utilizador.
 */
public abstract class PlanoSubscricao implements Serializable {
    private String nome;

    /**
     * Construtor do plano.
     * 
     * @param nome Nome do plano.
     */
    public PlanoSubscricao(String nome) {
        this.nome = nome;
    }

    /**
     * Obtém o nome do plano.
     * 
     * @return Nome do plano.
     */
    public String getNome() {
        return nome;
    }

    /**
     * Calcula os pontos ganhos por um utilizador ao reproduzir uma música.
     * 
     * @param u Utilizador que reproduz.
     * @return Pontos atribuídos.
     */
    public abstract int pontosPorReproducao(Utilizador u);
}

