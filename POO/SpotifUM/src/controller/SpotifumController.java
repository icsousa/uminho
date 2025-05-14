package controller;

import model.*;
import java.util.*;
import java.util.stream.Collectors;

/**
 * Classe que centraliza a lógica de controlo da aplicação SpotifUM.
 */
public class SpotifumController {
    private Map<String, Utilizador> utilizadores;
    private List<Musica> musicas;
    private List<Album> albuns;
    private List<Playlist> playlists;

    /**
     * 
     * @param utilizadores
     * @param musicas
     * @param albuns
     * @param playlists
     */
    public SpotifumController(Map<String, Utilizador> utilizadores, List<Musica> musicas, List<Album> albuns, List<Playlist> playlists) {
        this.utilizadores = utilizadores;
        this.musicas = musicas;
        this.albuns = albuns;
        this.playlists = playlists;
    }

    /**
     * Retorna a música mais reproduzida.
     * 
     * @return Música mais reproduzida.
     */
    public Optional<Musica> musicaMaisReproduzida() {
        return musicas.stream()
                      .max(Comparator.comparingInt(Musica::getNumeroReproducoes));
    }

    /**
     * Retorna o intérprete mais escutado (soma das reproduções de suas músicas).
     * 
     * @return Intérprete mais escutado.
     */
    public Optional<String> interpreteMaisEscutado() {
        return musicas.stream()
                .collect(Collectors.groupingBy(Musica::getInterprete, Collectors.summingInt(Musica::getNumeroReproducoes)))
                .entrySet().stream()
                .max(Map.Entry.comparingByValue())
                .map(Map.Entry::getKey);
    }

    /**
     * Retorna o utilizador com mais músicas ouvidas desde sempre.
     * 
     * @return Utilizador com mais músicas ouvidas.
     */
    public Optional<Utilizador> utilizadorMaisAtivo() {
        return utilizadores.values().stream()
                .max(Comparator.comparingInt(u -> u.getHistoricoReproducoes().values().stream().mapToInt(Integer::intValue).sum()));
    }

    /**
     * Retorna o utilizador com mais pontos.
     * 
     * @return Utilizador com mais pontos.
     */
    public Optional<Utilizador> utilizadorComMaisPontos() {
        return utilizadores.values().stream()
                .max(Comparator.comparingInt(Utilizador::getPontos));
    }

    /**
     * Retorna o género musical mais reproduzido.
     * 
     * @return Género musical mais reproduzido.
     */
    public Optional<String> generoMaisReproduzido() {
        return musicas.stream()
                .collect(Collectors.groupingBy(Musica::getGenero, Collectors.summingInt(Musica::getNumeroReproducoes)))
                .entrySet().stream()
                .max(Map.Entry.comparingByValue())
                .map(Map.Entry::getKey);
    }

    /**
     * Conta quantas playlists públicas existem no sistema.
     * 
     * @return Número de PlayLists públicas.
     */
    public long contarPlaylistsPublicas() {
        return playlists.stream().filter(Playlist::isPublica).count();
    }

    /**
     * Retorna o utilizador que criou mais playlists.
     * 
     * @return Utilizador que mais criou PlayLists.
     */
    public Optional<Utilizador> utilizadorComMaisPlaylists() {
        return utilizadores.values().stream()
                .max(Comparator.comparingInt(u -> u.getPlaylists().size()));
    }

    /**
     * Adiciona uma música ao sistema.
     * 
     * @param m Música a ser adicionada.
     */
    public void adicionarMusica(Musica m) {
        if (musicas == null) musicas = new ArrayList<>();
        musicas.add(m);
    }

    /**
     * Adiciona um utilizador ao sistema.
     * 
     * @param u Utilizador a ser adicionado.
     */
    public void adicionarUtilizador(Utilizador u) {
        if (utilizadores == null) utilizadores = new HashMap<>();
        utilizadores.put(u.getEmail(), u);
    }

    /**
     * Obtém um utilizador com base no email.
     *
     * @param email Email do utilizador.
     * @return Optional com o utilizador, se existir.
     */
    public Optional<Utilizador> getUtilizador(String email) {
        return Optional.ofNullable(utilizadores.get(email));
    }

    /**
     * Retorna uma lista de músicas disponiveis no sistema.
     * 
     * @return Lista de músicas disponíveis no sistema.
     */
    public List<Musica> getMusicas() {
        return musicas;
    }

    /**
     * Retorna uma lista de playlists disponiveis no sistema.
     * 
     * @return Lista de playlists disponiveis no sistema.
     */
    public List<Playlist> getPlaylists() {
        return playlists;
    }

    /**
     * Adiciona uma playlist ao sistema (apenas públicas devem ser mostradas).
     *
     * @param p Playlist a adicionar.
     */
    public void adicionarPlaylist(Playlist p) {
        if (playlists == null) playlists = new ArrayList<>();
        playlists.add(p);
    }

    /**
     * Retorna uma lista de álbuns disponiveis no sistema.
     * 
     * @return Lista de álbuns disponíveis no sistema.
     */
    public List<Album> getAlbuns() {
        return albuns;
    }
}


