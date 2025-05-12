package model;

import java.io.Serializable;
import java.util.*;

/**
 * Representa um álbum com um nome, artista principal e uma lista de músicas.
 */
public class Album implements Serializable {
    private String nome;
    private String artistaPrincipal;
    private List<Musica> musicas;

    /**
     * Construtor da classe Album.
     * 
     * @param nome Nome do álbum.
     * @param artistaPrincipal Artista do álbum.
     * @param musicas Lista de músicas que pertecem ao álbum.
     */
    public Album(String nome, String artistaPrincipal, List<Musica> musicas) {
        this.nome = nome;
        this.artistaPrincipal = artistaPrincipal;
        this.musicas = new ArrayList<>(musicas);
    }

    /**
     * Retorna o nome do álbum.
     * 
     * @return Nome do álbum.
     */
    public String getNome() {
        return nome;
    }
    
    /**
     * Devolve o artista responsável pelo o álbum.
     * 
     * @return Artista do álbum. 
     */
    public String getArtistaPrincipal() {
        return artistaPrincipal;
    }
    
    /**
     * Devolve a lista de músicas que compõem o álbum.
     * 
     * @return Listas de músicas do álbum. 
     */
    public List<Musica> getMusicas() {
        return musicas;
    }
}

