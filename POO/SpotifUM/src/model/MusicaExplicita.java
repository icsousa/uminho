package model;

import java.io.Serializable;
import java.util.*;

/**
 * Subclasse de Musica que representa uma música com conteúdo explícito.
 */
public class MusicaExplicita extends Musica {
    
    /**
     * Construtor da classe MusicaExplicita.
     *
     * @param nome Nome da música.
     * @param interprete Nome do intérprete.
     * @param editora Nome da editora.
     * @param letra Letra da música.
     * @param notacao Lista com as linhas musicais (ex: notação).
     * @param genero Género musical.
     * @param duracao Duração da música em segundos.
     */
    public MusicaExplicita(String nome, String interprete, String editora, String letra, String notacao, String genero, int duracao) {
        super(nome, interprete, editora, letra, notacao, genero, duracao);
    }

}