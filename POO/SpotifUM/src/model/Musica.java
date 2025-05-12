package model;

import java.io.Serializable;
import java.util.*;

/**
 * Representa uma música com letra, género e outras informações relevantes.
 */
public class Musica implements Serializable {
    private String nome;
    private String interprete;
    private String editora;
    private String letra;
    private String notacao;
    private String genero;
    private int duracao;
    private int numeroReproducoes;

    /**
     * Construtor da classe Musica.
     *
     * @param nome Nome da música.
     * @param interprete Nome do intérprete.
     * @param editora Nome da editora.
     * @param letra Letra da música.
     * @param notacao Lista com as linhas musicais (ex: notação).
     * @param genero Género musical.
     * @param duracao Duração da música em segundos.
     */
    public Musica(String nome, String interprete, String editora, String letra, String notacao, String genero, int duracao) {
        this.nome = nome;
        this.interprete = interprete;
        this.editora = editora;
        this.letra = letra;
        this.notacao = notacao;
        this.genero = genero;
        this.duracao = duracao;
        this.numeroReproducoes = 0;
    }

    /**
     * Devolve o nome da música.
     * 
     * @return Nome da música.
     */
    public String getNome() {
        return nome;
    }


    /**
     * Incrementa o número de reproduções da música.
     */
    public void incrementarReproducoes() {
        this.numeroReproducoes++;
    }

    /**
     * Devolve o número total de vezes que a música foi reproduzida.
     * 
     * @return Número de reproduções.
     */
    public int getNumeroReproducoes() {
        return this.numeroReproducoes;
    }

    /**
     * Obtém o nome da editora da música.
     * 
     * @return Nome da editora da música.
     */
    public String getEditora() {
        return editora;
    }

    /**
     * Obtém a letra da música.
     * 
     * @return Letra da música.
     */
    public String getLetra() {
        return letra;
    }

    /**
     * Retorna uma lista com a notação musical.
     * 
     * @return Lista com a notação musical.
     */
    public String getNotacao() {
        return notacao;
    }

    /**
     * Obtém a duração da música em segundos.
     * 
     * @return Duração da música em segundos.
     */
    public int getDuracao() {
        return duracao;
    }

    /**
     * Retorna o nome do intérprete da música.
     * 
     * @return Nome do intérprete da música.
     */
    public String getInterprete() {
        return interprete;
    }

    /**
     * Obtém o género musical da música.
     * 
     * @return Género musical da música.
     */
    public String getGenero() {
        return genero;
    }
    
}
