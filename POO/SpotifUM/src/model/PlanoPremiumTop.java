package model;

import java.io.Serializable;
import java.util.*;

/**
 * Plano premium com funcionalidades adicionais como playlists geradas automaticamente.
 */
public class PlanoPremiumTop extends PlanoSubscricao {

    /**
     * Construtor do plano Premium Top.
     */
    public PlanoPremiumTop() {
        super("PremiumTop");
    }

    /**
     * Calcula os pontos atribuídos por cada reprodução de uma nova música.
     *
     * @param u Utilizador que está a reproduzir a música.
     * @return Número de pontos atribuídos.
     */
    @Override
    public int pontosPorReproducao(Utilizador u) {
        return (int) Math.round(u.getPontos() * 0.025);
    }
}
