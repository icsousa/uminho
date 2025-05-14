package view;

import controller.SpotifumController;
import model.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

/**
 * Menu de interação com o utilizador via consola.
 */
public class Menu {
    private SpotifumController controller;
    private Scanner sc;
    private Utilizador utilizadorAtual;

    /**
     * Construtor do menu.
     * 
     * @param controller Controlador da aplicação.
     */
    public Menu(SpotifumController controller) {
        this.controller = controller;
        this.sc = new Scanner(System.in);
        this.utilizadorAtual = null;
    }

    /**
     * Inicia o menu principal.
     */
    public void iniciar() {
        limparConsola();
        
        int opcao;
        do {
            System.out.println("\n===== SpotifUM =====");
            System.out.println("1. Login");
            System.out.println("2. Criar novo utilizador");
            System.out.println("\n0. Sair");
            System.out.print("Opção: ");
            opcao = sc.nextInt();
            sc.nextLine();

            switch (opcao) {
                case 1 -> {
                    limparConsola();
                    login();
                }
                case 2 -> {
                    limparConsola();
                    criarUtilizador();
                }
                case 0 -> limparConsola();
                default -> {
                    limparConsola();
                    System.out.println("Opção inválida.");
                }
            }
        } while (opcao != 0);
    }

    /**
     * Realiza o login do utilizador com base no email.
     */
    private void login() {

        
        System.out.println("\n===== SpotifUM =====");
        System.out.print("Email: ");
        String email = sc.nextLine();
        Optional<Utilizador> user = controller.getUtilizador(email);
        
        if (user.isPresent()) {
            utilizadorAtual = user.get();
            menuUtilizador();
        } else {
            
            System.out.println("Utilizador não encontrado.");
        }
    }

    /**
     * Permite criar um novo utilizador.
     */
    private void criarUtilizador() {
        

        System.out.println("\n--- Criar Novo Utilizador ---");
        System.out.print("Nome: ");
        String nome = sc.nextLine();
        String email;
        do {
            System.out.print("Email: ");
            email = sc.nextLine().trim();

            if (email.isEmpty()) {
                System.out.println("O email não pode estar vazio.");
            } else if (controller.getUtilizador(email).isPresent()) {
                System.out.println("Este email já está associado a um utilizador.");
                email = ""; // força a repetir
            }
        } while (email.isEmpty());
        System.out.print("Morada: ");
        String morada = sc.nextLine();

        System.out.println("Escolha o plano:");
        System.out.println("1. Free");
        System.out.println("2. PremiumBase");
        System.out.println("3. PremiumTop");
        System.out.print("\nOpção: ");
        int planoOpt = sc.nextInt();
        sc.nextLine();

        PlanoSubscricao plano = switch (planoOpt) {
            case 2 -> new PlanoPremiumBase();
            case 3 -> new PlanoPremiumTop();
            default -> new PlanoFree();
        };

        Utilizador novo = new Utilizador(nome, email, morada, plano, controller.getMusicas());
        controller.adicionarUtilizador(novo);
        System.out.println("Utilizador criado com sucesso!");
    }

    /**
     * Menu do utilizador autenticado.
     */
    private void menuUtilizador() {
        
        limparConsola();

        int opcao;
        do {
            boolean isFree = utilizadorAtual.getPlano() instanceof PlanoFree;
            System.out.println("\n===== SpotifUM =====");
            System.out.println("1. Reproduzir Música " + (isFree ? "(Aleatória)" : ""));
            System.out.println("2. Adicionar Nova Música");
            System.out.println("3. Reproduzir Álbuns");
            System.out.println("4. Adicionar Novo Álbum");
            System.out.println("5. Biblioteca");
            System.out.println("6. Playlist's");
            System.out.println("7. Perfil");
            System.out.println("8. Atualizar Plano");
            System.out.println("9. Estatísticas");
            System.out.println("\n0. Logout");
            System.out.print("Opção: ");
            opcao = sc.nextInt();
            sc.nextLine();

            switch (opcao) {
                case 1 -> {
                    limparConsola();
                    if (isFree) reproduzirAleatoria();
                    else reproduzirMusica();
                }
                case 2 -> {
                    limparConsola();
                    criarMusica();
                }
                case 3 -> {
                    limparConsola();
                    if(isFree) System.out.println("\nAtualize o seu plano.");
                    else reproduzirAlbumGlobal();
                }
                case 4 -> {
                    limparConsola();
                    criarAlbum();
                }
                case 5 -> {
                    limparConsola();
                    menuBiblioteca();

                }
                case 6 -> {
                    limparConsola();
                    menuPlaylists();
                }
                case 7 -> {
                    limparConsola();
                    perfilUtilizador();
                    
                }
                case 8 -> {
                    limparConsola();
                    menuAtualizarPlano();
                    
                }
                case 9 -> {
                    limparConsola();
                    menuEstatisticas();
                    
                }
                case 0 -> {
                    limparConsola();
                    System.out.println("Logout efetuado com sucesso.");
                    utilizadorAtual = null;
                }
                default -> {
                    limparConsola();
                    System.out.println("Opção inválida.");
                }
            }   

        } while (opcao != 0);
    }

    /**
     * Cria Música.
     */
    private void criarMusica() {
        
        System.out.println("\n--- Adicionar Nova Música ---");
        
        System.out.print("Nome da música: ");
        String nome = sc.nextLine();

        System.out.print("Intérprete: ");
        String interprete = sc.nextLine();

        System.out.print("Editora: ");
        String editora = sc.nextLine();

        System.out.print("Letra: ");
        String letra = sc.nextLine();

        System.out.print("Notação Musical: ");
        String notacao = sc.nextLine();

        System.out.print("Género: ");
        String genero = sc.nextLine();

        System.out.print("Duração (em segundos): ");
        int duracao;
        try {
            duracao = Integer.parseInt(sc.nextLine());
        } catch (NumberFormatException e) {
            System.out.println("Duração inválida.");
            return;
        }

        System.out.print("É música explícita? (s/n): ");
        boolean explicita = sc.nextLine().trim().equalsIgnoreCase("s");

        Musica nova;
        if (explicita) {
            nova = new MusicaExplicita(nome, interprete, editora, letra, notacao, genero, duracao);
        } else {
            nova = new Musica(nome, interprete, editora, letra, notacao, genero, duracao);
        }

        controller.adicionarMusica(nova);
        System.out.println("Música adicionada com sucesso!");
    }

    /**
     * Cria Álbum.
     */
    private void criarAlbum() {
        System.out.println("\n--- Adicionar Novo Álbum ---");
        System.out.print("Nome do álbum: ");
        String nome = sc.nextLine();
    
        System.out.print("Artista: ");
        String artista = sc.nextLine();
    
        List<Musica> catalogo = controller.getMusicas();
        if (catalogo.isEmpty()) {
            System.out.println("Não há músicas disponíveis.");
            return;
        }
    
        System.out.println("\n--- Catálogo de Músicas ---");
        for (int i = 0; i < catalogo.size(); i++) {
            System.out.println((i + 1) + ". " + catalogo.get(i).getNome() + " - " + catalogo.get(i).getInterprete());
        }
    
        List<Musica> selecionadas = new ArrayList<>();
        String input;
        do {
            System.out.print("Escolha número da música (ENTER para terminar): ");
            input = sc.nextLine();
            if (!input.isBlank()) {
                try {
                    int escolha = Integer.parseInt(input);
                    if (escolha >= 1 && escolha <= catalogo.size()) {
                        selecionadas.add(catalogo.get(escolha - 1));
                    } else {
                        System.out.println("Número inválido.");
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Entrada inválida.");
                }
            }
        } while (!input.isBlank());
    
        if (selecionadas.isEmpty()) {
            System.out.println("Nenhuma música selecionada. Álbum não criado.");
            return;
        }
    
        Album novo = new Album(nome, artista, selecionadas);
        utilizadorAtual.adicionarAlbumABiblioteca(novo);
        controller.getAlbuns().add(novo);
    
        System.out.println("Álbum \"" + nome + "\" criado e publicado com sucesso!");
    }
    
    /**
     * Reproduz os álbuns do sistema.
     */
    private void reproduzirAlbumGlobal() {
        
        List<Album> albunsSistema = controller.getAlbuns();
    
        if (albunsSistema.isEmpty()) {
            System.out.println("Não há álbuns disponíveis.");
            return;
        }
    
        
            System.out.println("\n--- Catálogo de Álbuns ---");
            for (int i = 0; i < albunsSistema.size(); i++) {
                Album a = albunsSistema.get(i);
                System.out.println((i + 1) + ". " + a.getNome() + " (por " + a.getArtistaPrincipal() + ")");
            }
            System.out.println("\n0. Voltar");
            System.out.print("Escolha um álbum para reproduzir: ");
            String input = sc.nextLine();
    
            if (input.equals("0")) return;
    
            try {
                int escolha = Integer.parseInt(input);
                if (escolha >= 1 && escolha <= albunsSistema.size()) {
                    Album selecionado = albunsSistema.get(escolha - 1);
                    System.out.println("\n♪ A reproduzir álbum: " + selecionado.getNome());
                    List<Musica> lista = new ArrayList<>(selecionado.getMusicas());
                    reproduzirComControlo(lista);
        
                } else {
                    System.out.println("Número inválido.");
                }
            } catch (NumberFormatException e) {
                System.out.println("Entrada inválida.");
            }
        
    }
    


    /**
     * Reproduzir música.
     */
    private void reproduzirMusica() {
        
        System.out.println("\n--- Catálogo de Músicas ---");

        // Listar músicas disponíveis
        var musicas = controller.getMusicas();
        if (musicas.isEmpty()) {
            System.out.println("Não existem músicas disponíveis.");
            return;
        }

        for (int i = 0; i < musicas.size(); i++) {
            Musica m = musicas.get(i);
            System.out.println((i + 1) + ". " + m.getNome() + " - " + m.getInterprete());
        }

        System.out.print("\n0. Voltar");
        System.out.print("\nOpção: ");
        int escolha = sc.nextInt();
        sc.nextLine();

        if(escolha == 0) return;

        if (escolha < 1 || escolha > musicas.size()) {
            System.out.println("Escolha inválida.");
            return;
        }

        Musica escolhida = musicas.get(escolha - 1);
        utilizadorAtual.reproduzirMusica(escolhida);

        List<Musica> unicaMusica = new ArrayList<>();
        unicaMusica.add(escolhida);

        reproduzirComControlo(unicaMusica);
    }

    /**
     * Reproduz uma música aleatória do sistema (para utilizadores Free).
     */
    private void reproduzirAleatoria() {
        List<Musica> todas = controller.getMusicas();
        if (todas.isEmpty()) {
            System.out.println("Não há músicas disponíveis.");
            return;
        }
    
        Musica m = todas.get(new Random().nextInt(todas.size()));
        List<Musica> unicaMusica = List.of(m);
    
        reproduzirComControlo(unicaMusica);
    }
    
    /**
     * Mostra o menu da Biblioteca.
     */
    private void menuBiblioteca() {
        System.out.println("\n--- Biblioteca ---");
    
        Biblioteca biblioteca = utilizadorAtual.getBiblioteca();
        List<Album> albuns = biblioteca.getAlbuns();
        List<Playlist> externas = biblioteca.getPlaylistsExternas();
        List<Playlist> proprias = utilizadorAtual.getPlaylists();
        int index = 1;
        List<Object> elementos = new ArrayList<>();
    
        if (albuns.isEmpty() && externas.isEmpty() && proprias.isEmpty()) {
            System.out.println("A sua biblioteca está vazia.\n");
        } else {
            if (!albuns.isEmpty()) {
                System.out.println("Álbuns:");
                for (Album a : albuns) {
                    System.out.println(index + ". " + a.getNome() + " (por " + a.getArtistaPrincipal() + ")");
                    elementos.add(a);
                    index++;
                }
            }
    
            if (!proprias.isEmpty()) {
                System.out.println("Suas Playlist's:");
                for (Playlist p : proprias) {
                    System.out.println(index + ". " + p.getNome() + " (" + p.getMusicas().size() + " músicas)");
                    elementos.add(p);
                    index++;
                }
            }
    
            if (!externas.isEmpty()) {
                System.out.println("Playlist's Públicas:");
                for (Playlist p : externas) {
                    System.out.println(index + ". " + p.getNome() + " (" + p.getMusicas().size() + " músicas)");
                    elementos.add(p);
                    index++;
                }
            }
        }
    
        if (!(utilizadorAtual.getPlano() instanceof PlanoFree)) {
            System.out.println("\nA. Adicionar Álbum");
            System.out.println("B. Adicionar Playlist Pública");
        }
    
        System.out.println("\n0. Voltar");
        System.out.print("Opção: ");
        String opcao = sc.nextLine().trim().toUpperCase();
    
        switch (opcao) {
            case "0" -> {}
            case "A" -> {
                if (utilizadorAtual.getPlano() instanceof PlanoFree) {
                    System.out.println("Opção inválida.");
                    return;
                }
    
                List<Album> albunsSistema = controller.getAlbuns();
                System.out.println("\n--- Catálogo de Álbuns ---");
    
                if (albunsSistema.isEmpty()) {
                    System.out.println("\nNão existem álbuns disponíveis.");
                    return;
                }
    
                for (int j = 0; j < albunsSistema.size(); j++) {
                    Album a = albunsSistema.get(j);
                    System.out.println((j + 1) + ". " + a.getNome() + " - " + a.getArtistaPrincipal());
                }
                System.out.println("0. Voltar");
                System.out.print("Escolha o número do álbum: ");
                try {
                    int escolha = Integer.parseInt(sc.nextLine());
                    if (escolha == 0) return;
                    if (escolha >= 1 && escolha <= albunsSistema.size()) {
                        utilizadorAtual.adicionarAlbumABiblioteca(albunsSistema.get(escolha - 1));
                        System.out.println("Álbum adicionado à biblioteca.");
                    } else {
                        System.out.println("Número inválido.");
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Entrada inválida.");
                }
            }
            case "B" -> {
                if (utilizadorAtual.getPlano() instanceof PlanoFree) {
                    System.out.println("Opção inválida.");
                    return;
                }
    
                List<Playlist> publicas = controller.getPlaylists().stream().filter(Playlist::isPublica).toList();
    
                System.out.println("\n--- Playlist's Públicas ---");
    
                if (publicas.isEmpty()) {
                    System.out.println("\nNão existem playlists públicas disponíveis.");
                    return;
                }
    
                for (int j = 0; j < publicas.size(); j++) {
                    Playlist p = publicas.get(j);
                    System.out.println((j + 1) + ". " + p.getNome() + " (" + p.getMusicas().size() + " músicas)");
                }
                System.out.print("Escolha o número da playlist: ");
                try {
                    int escolha = Integer.parseInt(sc.nextLine());
                    if (escolha >= 1 && escolha <= publicas.size()) {
                        utilizadorAtual.getBiblioteca().adicionarPlaylistExterna(publicas.get(escolha - 1));
                        System.out.println("Playlist adicionada à biblioteca.");
                    } else {
                        System.out.println("Número inválido.");
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Entrada inválida.");
                }
            }
            default -> {
                try {
                    int num = Integer.parseInt(opcao);
                    if (num >= 1 && num <= elementos.size()) {
                        Object escolhido = elementos.get(num - 1);
                        if (escolhido instanceof Album album) {
                            System.out.println("\n♪ A reproduzir álbum: " + album.getNome());
                            reproduzirComControlo(new ArrayList<>(album.getMusicas()));
                        } else if (escolhido instanceof Playlist p) {
                            System.out.println("\n♪ A reproduzir playlist: " + p.getNome());
                            List<Musica> lista = new ArrayList<>(p.getMusicas());
                            if (p.isAleatoria()) Collections.shuffle(lista);
                            reproduzirComControlo(lista);
                        }
                    } else {
                        System.out.println("Número inválido.");
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Entrada inválida.");
                }
            }
        }
    }
    

    /**
     * Mostra opções de gestão de playlists do utilizador.
     */
    private void menuPlaylists() {
        
        int opcao;
        boolean isFree = utilizadorAtual.getPlano() instanceof PlanoFree;
        boolean permiteAutomaticas = utilizadorAtual.getPlano() instanceof PlanoPremiumTop;

        do {
            System.out.println("\n--- Playlist's ---");
            System.out.println("1. Ver Suas Playlist's");
            if (!isFree) {
                System.out.println("2. Ver Playlist's Públicas");
                System.out.println("3. Criar Nova Playlist");
            }
            if (permiteAutomaticas) {
                System.out.println("4. Gerar Playlist Automática");
            }
            System.out.println("\n0. Voltar");
            System.out.print("Opção: ");
            opcao = sc.nextInt();
            sc.nextLine();

            switch (opcao) {
                case 1 -> {
                    limparConsola();
                    mostrarSuasPlaylists();
                }
                case 2 -> {
                    limparConsola();
                    if (!isFree) mostrarPlaylistsPublicas();
                    else System.out.println("Opção inválida.");
                }
                case 3 -> {
                    limparConsola();
                    if (!isFree) criarPlaylist();
                    else System.out.println("Opção inválida.");
                }
                case 4 -> {
                    limparConsola();
                    if (permiteAutomaticas) gerarPlaylistAutomatica();
                    else System.out.println("Opção inválida.");
                }
                case 0 -> {}
                default -> {
                    limparConsola();
                    System.out.println("Opção inválida.");
                }
            }
        } while (opcao != 0);
    }

    /**
     * Mostra as playlists pessoais e permite escolher uma para reproduzir.
     */
    private void mostrarSuasPlaylists() {
        
        List<Playlist> playlists = utilizadorAtual.getPlaylists();

        if (playlists.isEmpty()) {
            System.out.println("Não tens playlist's criadas.");
            return;
        }

        while (true) {
            System.out.println("\n--- Suas Playlist's ---");
            for (int i = 0; i < playlists.size(); i++) {
                Playlist p = playlists.get(i);
                System.out.println((i + 1) + ". " + p.getNome() +
                        " (" + p.getMusicas().size() + " músicas) - " +
                        (p.isPublica() ? "Pública" : "Privada"));
            }
            System.out.println("\n0. Voltar");
            System.out.print("Escolha uma playlist para reproduzir: ");
            int opcao = sc.nextInt();
            sc.nextLine();

            if (opcao == 0) return;
            if (opcao >= 1 && opcao <= playlists.size()) {
                reproduzirPlaylist(playlists.get(opcao - 1));
            } else {
                System.out.println("Opção inválida.");
            }
        }
    }

    /**
     * Mostra playlists públicas e permite reproduzir uma.
     */
    private void mostrarPlaylistsPublicas() {
        
        List<Playlist> todas = controller.getPlaylists();
        List<Playlist> publicas = todas.stream()
                .filter(Playlist::isPublica)
                .toList();

        if (publicas.isEmpty()) {
            System.out.println("Não existem playlist's públicas disponíveis.");
            return;
        }

        while (true) {
            System.out.println("\n--- Playlist's Públicas ---");
            for (int i = 0; i < publicas.size(); i++) {
                Playlist p = publicas.get(i);
                System.out.println((i + 1) + ". " + p.getNome() +
                        " (" + p.getMusicas().size() + " músicas)");
            }
            System.out.println("\n0. Voltar");
            System.out.print("Escolha uma playlist para reproduzir: ");
            int opcao = sc.nextInt();
            sc.nextLine();

            if (opcao == 0) return;
            if (opcao >= 1 && opcao <= publicas.size()) {
                reproduzirPlaylist(publicas.get(opcao - 1));
            } else {
                System.out.println("Opção inválida.");
            }
        }
    }

    /**
     * Permite ao utilizador criar uma nova playlist manualmente.
     */
    private void criarPlaylist() {  
        System.out.println("\n--- Criar PlayList ---"); 
        System.out.print("Nome da playlist: ");
        String nome = sc.nextLine();

        List<Musica> catalogo = controller.getMusicas();
        if (catalogo.isEmpty()) {
            System.out.println("Não há músicas disponíveis.");
            return;
        }

        System.out.println("\n--- Catálogo de Músicas ---");
        for (int i = 0; i < catalogo.size(); i++) {
            System.out.println((i + 1) + ". " + catalogo.get(i).getNome() + " - " + catalogo.get(i).getInterprete());
        }

        List<Musica> selecionadas = new ArrayList<>();
        String input;
        do {
            System.out.print("Escolha número da música (ou ENTER para terminar): ");
            input = sc.nextLine();
            if (!input.isBlank()) {
                try {
                    int escolha = Integer.parseInt(input);
                    if (escolha >= 1 && escolha <= catalogo.size()) {
                        selecionadas.add(catalogo.get(escolha - 1));
                    } else {
                        System.out.println("Número inválido.");
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Entrada inválida.");
                }
            }
        } while (!input.isBlank());

        System.out.print("A playlist é pública? (s/n): ");
        boolean publica = sc.nextLine().trim().equalsIgnoreCase("s");

        System.out.print("Reprodução aleatória? (s/n): ");
        boolean aleatoria = sc.nextLine().trim().equalsIgnoreCase("s");

        Playlist nova = new Playlist(nome, selecionadas, publica, aleatoria);
        utilizadorAtual.getPlaylists().add(nova);
        if (nova.isPublica()) {
            controller.adicionarPlaylist(nova);
        }        

        System.out.println("Playlist criada com sucesso!");
    }

    /**
     * Gera uma playlist automática baseada em critérios escolhidos.
     */
    private void gerarPlaylistAutomatica() {
        
        System.out.println("\n--- Tipos de Playlist Automática ---");
        System.out.println("1. Favoritas");
        System.out.println("2. Por género");
        System.out.println("3. Músicas explícitas");
        System.out.println("\n0. Voltar");
        System.out.print("Opção: ");
        int opcao = sc.nextInt();
        sc.nextLine();

        List<Musica> selecionadas = new ArrayList<>();
        String nome = "";

        switch (opcao) {
            case 1 -> {
                nome = "Favoritas";
                Map<Musica, Integer> hist = utilizadorAtual.getHistoricoReproducoes();
                selecionadas = hist.entrySet().stream()
                        .sorted((e1, e2) -> e2.getValue() - e1.getValue())
                        .limit(10)
                        .map(Map.Entry::getKey)
                        .toList();
            }
            case 2 -> {
                System.out.print("Insira o género: ");
                String genero = sc.nextLine().trim().toLowerCase();
                System.out.print("Duração máxima da playlist (em segundos): ");
                int duracaoMaxima = Integer.parseInt(sc.nextLine());
            
                nome = "Género: " + genero;
                int acumulado = 0;
                selecionadas = new ArrayList<>();
            
                for (Musica m : controller.getMusicas()) {
                    if (m.getGenero().equalsIgnoreCase(genero) && acumulado + m.getDuracao() <= duracaoMaxima) {
                        selecionadas.add(m);
                        acumulado += m.getDuracao();
                    }
                }
            }
            case 3 -> {
                nome = "Explícitas";
                selecionadas = controller.getMusicas().stream()
                        .filter(m -> m instanceof MusicaExplicita)
                        .toList();
            }
            default -> {
                System.out.println("Opção inválida.");
                return;
            }
        }

        if (selecionadas.isEmpty()) {
            System.out.println("Nenhuma música encontrada com os critérios.");
            return;
        }

        Playlist nova = new Playlist(nome, selecionadas, false, false);
        utilizadorAtual.getPlaylists().add(nova);
        if (nova.isPublica()) {
            controller.adicionarPlaylist(nova);
        }        
        System.out.println("Playlist '" + nome + "' criada com sucesso!");
    }

    /**
     * Reproduz músicas com controlos para avançar, recuar e parar.
     * 
     * @param lista Lista de músicas.
     */
    private void reproduzirComControlo(List<Musica> lista) {
        boolean apenasPausa = utilizadorAtual.getPlano() instanceof PlanoFree;
        int index = 0;
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
    
        while (index >= 0 && index < lista.size()) {
            Musica m = lista.get(index);
            utilizadorAtual.reproduzirMusica(m);
            System.out.println("\n");
            System.out.println("\n♪ " + m.getNome() + " - " + m.getInterprete());
            System.out.println("Letra:\n" + m.getLetra());
    
            int duracao = m.getDuracao();
            int ciclosTotais = duracao * 2;
            int tentativas = 0;
            String comando = "";
    
            if (apenasPausa) {
            
                System.out.print("\n[P]ausar: ");
            
                while (tentativas < ciclosTotais) {
                    try {
                        Thread.sleep(500);
                        if (System.in.available() > 0) {
                            String input = reader.readLine().trim().toLowerCase();
                            if (input.equals("p")) {
                                System.out.println("Em pausa. Prima ENTER para retomar...");
                                reader.readLine();
                                System.out.println("A retomar...");
                                System.out.print("[P]ausar: ");
                            }
                        }
                    } catch (IOException | InterruptedException e) {
                        e.printStackTrace();
                    }
                    tentativas++;
                }
            
                index++;
                continue;
            }
                        
            System.out.print("\n[A]vançar  [P]ausar  [R]ecuar: ");
    
            while (tentativas < ciclosTotais) {
                try {
                    Thread.sleep(500);
                    if (System.in.available() > 0) {
                        comando = reader.readLine().trim().toLowerCase();
    
                        switch (comando) {
                            case "a" -> {
                                index++;
                                tentativas = ciclosTotais;
                            }
                            case "r" -> {
                                index = Math.max(0, index - 1);
                                tentativas = ciclosTotais;
                            }
                            case "p" -> {
                                System.out.println("Em pausa. Prima ENTER para retomar...");
                                reader.readLine();
                                System.out.println("A retomar...");
                                System.out.print("[A]vançar  [P]ausar  [R]ecuar: ");
                            }
                            default -> System.out.println("Comando inválido.");
                        }
                    }
                } catch (IOException | InterruptedException e) {
                    e.printStackTrace();
                }
    
                if (!comando.equals("a") && !comando.equals("r")) {
                    tentativas++;
                }
            }
    
            if (comando.isEmpty() || comando.equals("p")) {
                index++;
            }
        }
    
        System.out.println("\nReprodução concluída. Pontos acumulados: " + utilizadorAtual.getPontos());    
    }
    
    /**
     * Reproduz uma playlist com navegação, se aplicável.
     * 
     * @param p Playlist a reproduzir.
     */
    private void reproduzirPlaylist(Playlist p) {
        List<Musica> lista = new ArrayList<>(p.getMusicas());
        if (p.isAleatoria()) Collections.shuffle(lista);
        reproduzirComControlo(lista);
    }

    /**
     * Perfil do utilizador.
     */
    private void perfilUtilizador() {
        
        System.out.println("\n--- Perfil ---");
        System.out.println("Nome: " + utilizadorAtual.getNome());
        System.out.println("Email: " + utilizadorAtual.getEmail());
        System.out.println("Morada: " + utilizadorAtual.getMorada());
        System.out.println("Plano: " + utilizadorAtual.getPlano().getNome());
        System.out.println("Pontos: " + utilizadorAtual.getPontos());
    }

    /**
     * Mostra um menu, onde o utilizador consegue atualizar o plano.
     */
    private void menuAtualizarPlano() {
        
        System.out.println("\n--- Atualizar Plano ---");
        System.out.println("Escolha o plano:");
        
        boolean isFree = utilizadorAtual.getPlano() instanceof PlanoFree;
        boolean isPremiumBase = utilizadorAtual.getPlano() instanceof PlanoPremiumBase;
        boolean isPremiumTop = utilizadorAtual.getPlano() instanceof PlanoPremiumTop;

        if (isFree) {
            System.out.println("1. PremiumBase");
            System.out.println("2. PremiumTop");
        }
        else if (isPremiumBase) {
            System.out.println("1. Free");
            System.out.println("2. PremiumTop");
        }
        else if (isPremiumTop) {
            System.out.println("1. Free");
            System.out.println("2. PremiumBase");
        }
        System.out.println("\n0. Voltar");
        System.out.print("Opção: ");
        int planoOpt = sc.nextInt();
        sc.nextLine();

        switch (planoOpt) {
            case 1 -> {
                if (isFree) utilizadorAtual.setPlano(new PlanoPremiumBase());
                else utilizadorAtual.setPlano(new PlanoFree());
            }
            case 2 -> {
                if (isPremiumTop) utilizadorAtual.setPlano(new PlanoPremiumBase());
                else {
                    utilizadorAtual.adicionarPontos(100);
                    utilizadorAtual.setPlano(new PlanoPremiumTop());
                }
            }
            case 0 -> {} 
            
            default -> System.out.println("Opção inválida.");
        };
    }
    

    /**
     * Mostra o menu de estatísticas disponíveis no sistema.
     */
    private void menuEstatisticas() {
        
        System.out.println("\n--- Estatísticas ---");

        controller.musicaMaisReproduzida().ifPresentOrElse(
            m -> System.out.println("Música mais reproduzida: " + m.getNome()),
            () -> System.out.println("Nenhuma música reproduzida ainda.")
        );

        controller.interpreteMaisEscutado().ifPresentOrElse(
            i -> System.out.println("Intérprete mais escutado: " + i),
            () -> System.out.println("Nenhum intérprete ainda.")
        );

        controller.utilizadorMaisAtivo().ifPresentOrElse(
            u -> System.out.println("Utilizador mais ativo: " + u.getNome()),
            () -> System.out.println("Nenhum utilizador ativo.")
        );

        controller.utilizadorComMaisPontos().ifPresentOrElse(
            u -> System.out.println("Utilizador com mais pontos: " + u.getNome()),
            () -> System.out.println("Nenhum utilizador registado.")
        );

        controller.generoMaisReproduzido().ifPresentOrElse(
            g -> System.out.println("Género mais reproduzido: " + g),
            () -> System.out.println("Nenhum género encontrado.")
        );

        System.out.println("Playlists públicas: " + controller.contarPlaylistsPublicas());

        controller.utilizadorComMaisPlaylists().ifPresentOrElse(
            u -> System.out.println("Utilizador com mais playlists: " + u.getNome()),
            () -> System.out.println("Nenhuma playlist criada ainda.")
        );
    }
    
    /**
     * Limpar a consola, para deixar o Menu mais apresentável.
     */
    private static void limparConsola() {
        try {
            if (System.getProperty("os.name").contains("Windows")) {
                new ProcessBuilder("cmd", "/c", "cls").inheritIO().start().waitFor();
            } else {
                System.out.print("\033[H\033[2J");
                System.out.flush();
            }
        } catch (Exception e) {
            System.out.println("Não foi possível limpar a consola.");
        }
    }
    
}