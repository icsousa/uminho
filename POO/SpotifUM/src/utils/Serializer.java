package utils;

import java.io.*;

/**
 * Classe utilitária para guardar e carregar objetos serializados.
 */
public class Serializer {

    /**
     * Guarda um objeto em ficheiro.
     * 
     * @param obj Objeto a guardar.
     * @param filename Nome do ficheiro.
     * @throws IOException Se falhar a escrita.
     */
    public static void save(Object obj, String filename) throws IOException {
        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(filename))) {
            oos.writeObject(obj);
        }
    }

    /**
     * Carrega um objeto de um ficheiro.
     * 
     * @param filename Nome do ficheiro.
     * @return Objeto lido.
     * @throws IOException Se falhar a leitura.
     * @throws ClassNotFoundException Se a classe não for encontrada.
     */
    public static Object load(String filename) throws IOException, ClassNotFoundException {
        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(filename))) {
            return ois.readObject();
        }
    }
}


