package model;

import java.io.Serializable;
import java.util.*;

/**
 * Plano premium com acesso a criação de biblioteca e playlists.
 */
public class PlanoPremiumBase extends PlanoSubscricao {

    /**
     * Construtor do plano Premium Base.
     */
    public PlanoPremiumBase() {
        super("PremiumBase");
    }

    /**
     * Calcula os pontos atribuídos por cada reprodução de música neste plano.
     *
     * @param u Utilizador que está a reproduzir a música.
     * @return Número fixo de pontos atribuídos.
     */
    @Override
    public int pontosPorReproducao(Utilizador u) {
        return 10;
    }
}


