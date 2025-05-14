import model.Utilizador;
import model.Musica;
import model.Album;
import model.Playlist;
import utils.Serializer;
import controller.SpotifumController;
import view.Menu;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * Classe principal da aplicação SpotifUM.
 * Responsável por carregar os dados, iniciar o menu principal
 * e guardar o estado no final da execução.
 */
public class Main {

    /**
     * Ponto de entrada da aplicação.
     * Carrega dados serializados ou inicia listas novas se os ficheiros não existirem.
     * Inicia a interface de utilizador via consola e guarda o estado ao terminar.
     *
     * @param args Argumentos da linha de comandos.
     */
    @SuppressWarnings("unchecked")
    public static void main(String[] args) {

        String utilizadoresFile = "../resources/utilizadores.dat";
        String musicasFile = "../resources/musicas.dat";
        String albunsFile = "../resources/albuns.dat";
        String playlistsFile = "../resources/playlists.dat";

        Map<String, Utilizador> utilizadores;
        List<Musica> musicas;
        List<Album> albuns;
        List<Playlist> playlists;

        try {
            utilizadores = (Map<String, Utilizador>) Serializer.load(utilizadoresFile);
            musicas = (List<Musica>) Serializer.load(musicasFile);
            albuns = (List<Album>) Serializer.load(albunsFile);
            playlists = (List<Playlist>) Serializer.load(playlistsFile);
        } catch (Exception e) {
            System.out.println("Ficheiros não encontrados ou vazios, a iniciar com listas novas.");
            utilizadores = new HashMap<String, Utilizador>();
            musicas = new ArrayList<>();
            albuns = new ArrayList<>();
            playlists = new ArrayList<>();
        }

        SpotifumController controller = new SpotifumController(utilizadores, musicas, albuns, playlists);
        Menu menu = new Menu(controller);
        menu.iniciar();

        try {
            Serializer.save(utilizadores, utilizadoresFile);
            Serializer.save(musicas, musicasFile);
            Serializer.save(albuns, albunsFile);
            Serializer.save(playlists, playlistsFile);
        } catch (IOException e) {
            System.err.println("Erro ao guardar os dados: " + e.getMessage());
        }
    }
}
