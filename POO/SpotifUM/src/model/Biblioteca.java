package model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Representa a biblioteca pessoal de um utilizador premium.
 */
public class Biblioteca implements Serializable {
    private List<Album> albuns;
    private List<Playlist> playlistsExternas;

    /**
     * Construtor que inicializa a biblioteca vazia.
     */
    public Biblioteca() {
        this.albuns = new ArrayList<>();
        this.playlistsExternas = new ArrayList<>();
    }

    /**
     * Adiciona um álbum à biblioteca.
     * 
     * @param album Álbum a adicionar.
     */
    public void adicionarAlbum(Album album) {
        this.albuns.add(album);
    }

    /**
     * Adiciona uma playlist pública externa à biblioteca.
     * 
     * @param playlist Playlist a adicionar.
     */
    public void adicionarPlaylistExterna(Playlist playlist) {
        this.playlistsExternas.add(playlist);
    }

    /**
     * Retorna a lista de álbuns da biblioteca.
     * 
     * @return Lista de álbuns na biblioteca.
     */
    public List<Album> getAlbuns() {
        return new ArrayList<>(this.albuns);
    }

    /**
     * Retorna a lista de playlists externas da biblioteca.
     * 
     * @return Lista de playlists externas na biblioteca.
     */
    public List<Playlist> getPlaylistsExternas() {
        return new ArrayList<>(this.playlistsExternas);
    }

    /**
     * Devolve o tamanho da biblioteca.
     * 
     * @return Número total de elementos na biblioteca.
     */
    public int tamanhoTotal() {
        return albuns.size() + playlistsExternas.size();
    }

    /**
     * Verifica se a biblioteca está vazia.
     * 
     * @return true se não contiver álbuns nem playlists externas.
     */
    public boolean estaVazia() {
        return albuns.isEmpty() && playlistsExternas.isEmpty();
    }
}