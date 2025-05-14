package model;

import model.Biblioteca;
import model.Album;
import model.Playlist;
import java.io.Serializable;
import java.util.*;

/**
 * Representa um utilizador do sistema SpotifUM.
 */
public class Utilizador implements Serializable {
    private String nome;
    private String email;
    private String morada;
    private int pontos;
    private PlanoSubscricao plano;
    private Biblioteca biblioteca;
    private List<Playlist> playlists;
    private Map<Musica, Integer> historicoReproducoes;
    // Métodos para ganhar pontos, reproduzir músicas...
    
    /**
     * Construtor da classe Utilizador.
     *
     * @param nome Nome do utilizador.
     * @param email Email do utilizador.
     * @param morada Morada do utilizador.
     * @param plano Plano de subscrição associado.
     */
    public Utilizador(String nome, String email, String morada, PlanoSubscricao plano, List<Musica> catalogo) {
        this.nome = nome;
        this.email = email;
        this.morada = morada;
        this.plano = plano;
        this.pontos = 0;
        this.biblioteca = new Biblioteca();
        this.playlists = new ArrayList<>();
        this.historicoReproducoes = new HashMap<>();

        // Inicializa a playlist Aleatória com músicas do catálogo
        inicializarPlaylistAleatoria(catalogo);
        if (plano instanceof PlanoPremiumTop) pontos += 100;
    }

    /**
     * Retorna o nome do utilizador.
     * 
     * @return Nome do utilizador.
     */
    public String getNome() {
        return this.nome;
    }

    /**
     * Retorna o plano do utilizador.
     * 
     * @return Plano do utilizador.
     */
    public PlanoSubscricao getPlano() {
        return this.plano;
    }    

    /**
     * Retorna a morada do utilizador.
     * 
     * @return Morada do utilizador.
     */
    public String getMorada() {
        return this.morada;
    }

    /**
     * Reproduz uma música, atualizando o histórico, número de reproduções e pontos.
     * 
     * @param m Música a ser reproduzida.
     */
    public void reproduzirMusica(Musica m) {
        boolean primeiraVez = !historicoReproducoes.containsKey(m);
        m.incrementarReproducoes();
        int pontosGanhos = 0;
        this.historicoReproducoes.put(m, this.historicoReproducoes.getOrDefault(m, 0) + 1);
        if (plano instanceof PlanoPremiumTop && primeiraVez) {
            pontosGanhos = this.plano.pontosPorReproducao(this);
        } else if (!(plano instanceof PlanoPremiumTop)) {
            pontosGanhos = this.plano.pontosPorReproducao(this);
        }

        this.pontos += pontosGanhos;  
    }

    /**
     * Devolve o total de pontos do utilizador.
     * 
     * @return Pontos acumulados.
     */
    public int getPontos() {     
        return this.pontos;
    }

    /**
     * Retorna o email do utilizador.
     * 
     * @return Email do utilizador.
     */
    public String getEmail() {
        return this.email;
    }

    /**
     * Obtém o histórico de reproduções.
     * 
     * @return Histórico de reproduções.
     */
    public Map<Musica, Integer> getHistoricoReproducoes() {
        return new HashMap<>(this.historicoReproducoes); 
    }    

    /**
     * Devolve a lista de PlayLists do utilizador.
     * 
     * @return Lista de playlists do utilizador.
     */
    public List<Playlist> getPlaylists() {
        return this.playlists;
    }

    /**
     * Devolve a biblioteca do utilizador.
     * 
     * @return Biblioteca pessoal de álbuns e playlists públicas.
     */
    public Biblioteca getBiblioteca() { 
        return this.biblioteca; 
    }

    /**
     * Trocar o plano do utilizador.
     * 
     * @param novoPlano Novo plano do utilizador.
     */
    public void setPlano(PlanoSubscricao novoPlano) {
        this.plano = novoPlano;
    }
    

    /**
     * Método que deve ser chamado após o utilizador ser criado para atribuir músicas do catálogo à playlist "Aleatória".
     * 
     * @param catalogo Lista de músicas do sistema.
     */
    public void inicializarPlaylistAleatoria(List<Musica> catalogo) {
        List<Musica> selecionadas = new ArrayList<>(catalogo);
        Collections.shuffle(selecionadas);
        List<Musica> top10 = selecionadas.subList(0, Math.min(10, selecionadas.size()));
        Playlist aleatoria = new Playlist("Aleatória", top10, false, true);
        this.playlists.add(aleatoria);
    }    

    /**
     * Adiciona um álbum existente à biblioteca do utilizador.
     * 
     * @param album Álbum a adicionar.
     */
    public void adicionarAlbumABiblioteca(Album album) {
        this.biblioteca.adicionarAlbum(album);
    }

    /**
     * Adiciona um pontos ao utilizador.
     * 
     * @param pontos Pontos a adicionar.
     */
    public void adicionarPontos(int pontos) {
        this.pontos += pontos;
    }

}


