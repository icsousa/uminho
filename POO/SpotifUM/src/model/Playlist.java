package model;

import java.io.Serializable;
import java.util.*;

/**
 * Representa uma playlist de músicas que pode ser pública ou privada e ter reprodução aleatória.
 */
public class Playlist implements Serializable {
    private String nome;
    private List<Musica> musicas;
    private boolean publica;
    private boolean aleatoria;

    /**
     * Construtor da classe Playlist.
     *
     * @param nome Nome da playlist.
     * @param musicas Lista de músicas da playlist.
     * @param publica Se é pública.
     * @param aleatoria Se é aleatória.
     */
    public Playlist(String nome, List<Musica> musicas, boolean publica, boolean aleatoria) {
        this.nome = nome;
        this.musicas = new ArrayList<>(musicas);
        this.publica = publica;
        this.aleatoria = aleatoria;
    }    

    /**
     * Verifica se a PlayList é pública ou não.
     * 
     * @return Verdadeiro se a playlist for pública.
     */
    public boolean isPublica() {
        return publica;
    }

    /**
     * Verifica se a PlayList é aleatória ou não.
     * 
     * @return Verdadeiro se a playlist for aleatória.
     */
    public boolean isAleatoria() {
        return aleatoria;
    }

    /**
     * Devolve o nome da playlist.
     * 
     * @return Nome de playlist.
     */
    public String getNome() {
        return nome;
    }
    
    /**
     * Retorna as músicas que pertecem a playlist.
     * 
     * @return Lista de músicas da playlist.
     */
    public List<Musica> getMusicas() {
        return musicas;
    }  

}

