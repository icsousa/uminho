package model;

import java.io.Serializable;
import java.util.*;

/**
 * Plano gratuito com acesso limitado e pontuação básica.
 */
public class PlanoFree extends PlanoSubscricao {

    /**
     * Construtor do plano Free.
     */
    public PlanoFree() {
        super("Free");
    }

    /**
     * Calcula os pontos atribuídos por cada reprodução de música neste plano.
     *
     * @param u Utilizador que está a reproduzir a música.
     * @return Número fixo de pontos atribuídos.
     */
    @Override
    public int pontosPorReproducao(Utilizador u) {
        return 5;
    }
}
