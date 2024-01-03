--Ex.1
data BTree a = Empty
             | Node a (BTree a) (BTree a)
            deriving Show

--a) altura :: BTree a -> Int que calcula a altura da árvore
altura :: BTree a -> Int
altura Empty = 0
altura (Node r e d) = 1 + max (altura e) (altura d)

--b) contaNodos :: BTree a -> Int que calcula o número de nodos da árvore.
contaNodos :: BTree a -> Int
contaNodos Empty = 0
contaNodos (Node r e d) = 1 + contaNodos e + contaNodos d

--c) folhas :: BTree a -> Int, que calcula o número de folhas (i.e., nodos sem descendentes) da árvore.
folhas :: BTree a -> Int
folhas Empty = 0
folhas (Node r Empty Empty) = 1
folhas (Node r e d) = folhas e + folhas d

--d) prune :: Int -> BTree a -> BTree a, que remove de uma árvore todos os elementos a partir de uma determinada profundidade.
prune :: Int -> BTree a -> BTree a
prune 0 _ = Empty
prune _ Empty = Empty
prune x (Node r e d) = Node r (prune (x - 1) e) (prune (x - 1) d) 

--e) path :: [Bool] -> BTree a -> [a], que dado um caminho (False corresponde a esquerda e True a direita) e uma árvore, dá a lista com a informação dos nodos por onde esse caminho passa.
path :: [Bool] -> BTree a -> [a]
path [] _ = []
path (h:t) (Node r e d) = if h == False then r : path t e else r : path t d

--f) mirror :: BTree a -> BTree a, que dá a árvore simétrica.
mirror :: BTree a -> BTree a
mirror Empty = Empty
mirror (Node r e d) = (Node r (mirror d) (mirror e))

--g) zipWithBT :: (a -> b -> c) -> BTree a -> BTree b -> BTree c que generaliza a função zipWith para árvores binárias.
zipWithBT :: (a -> b -> c) -> BTree a -> BTree b -> BTree c
zipWithBT t (Node r1 e1 d1) (Node r2 e2 d2) = Node (t r1 r2) e d
                                            where
                                                e = (zipWithBT t e1 e2)
                                                d = (zipWithBT t d1 d2)
zipWithBT _ _ _ = Empty

--h) unzipBT :: BTree (a,b,c) -> (BTree a,BTree b,BTree c), que generaliza a função unzip (neste caso de triplos) para árvores binárias.
unzipBT :: BTree (a,b,c) -> (BTree a, BTree b, BTree c)
unzipBT (Node (r1, r2, r3) e d) = ((Node r1 e1 d1), (Node r2 e2 d2), (Node r3 e3 d3))
                              where
                                (e1, e2, e3) = unzipBT e
                                (d1, d2, d3) = unzipBT d 

--Ex.2
--a) Defina uma função minimo :: Ord a => BTree a -> a que determina o menor elemento de uma árvore binária de procura não vazia.
minimo :: Ord a => BTree a -> a
minimo (Node r Empty _) = r
minimo (Node r e d) = minimo e

--b) Defina uma função semMinimo :: Ord a => BTree a -> BTree a que remove o menor elemento de uma árvore binária de procura não vazia.
semMinimo :: Ord a => BTree a -> BTree a
semMinimo (Node r Empty Empty) = Empty
semMinimo (Node r Empty d) = d
semMinimo (Node r e d) = semMinimo e 

--c) Defina uma função minSmin :: Ord a => BTree a -> (a,BTree a) que calcula, com uma única travessia da árvore o resultado das duas funções anteriores.
minSmin :: Ord a => BTree a -> (a, BTree a)
minSmin t = (minimo t,semMinimo t)

--Ex.3
type Aluno = (Numero,Nome,Regime,Classificacao)
type Numero = Int
type Nome = String
data Regime = ORD 
            | TE 
            | MEL 
        deriving Show
data Classificacao = Aprov Int
                   | Rep
                   | Faltou
                deriving Show
type Turma = BTree Aluno

--a) inscNum :: Numero -> Turma -> Bool, que verifica se um aluno, com um dado número, está inscrito.
inscNum :: Numero -> Turma -> Bool
inscNum _ Empty = False
inscNum x (Node (n,nome,r,c) e d) | x < n = inscNum x e
                                  | x > n = inscNum x d
                                  | otherwise = True

--b) inscNome :: Nome -> Turma -> Bool, que verifica se um aluno, com um dado nome, está inscrito.
inscNome :: Nome -> Turma -> Bool
inscNome _ Empty = False
inscNome x (Node (n,nome,r,c) e d) = x == nome || inscNome x e || inscNome x d

--c) trabEst :: Turma -> [(Numero,Nome)], que lista o número e nome dos alunos trabalhadores-estudantes (ordenados por número).
trabEst :: Turma -> [(Numero,Nome)]
trabEst (Node (n,nome,r,c) e d) = case r of TE -> [(n,nome)] ++ trabEst e ++ trabEst d
                                            otherwise -> []

--d) nota :: Numero -> Turma -> Maybe Classificacao, que calcula a classificação de um aluno (se o aluno não estiver inscrito a função deve retornar Nothing).
nota :: Numero -> Turma -> Maybe Classificacao
nota _ Empty = Nothing
nota x (Node (n,nome,r,c) e d) | x < n = nota x e
                               | x > n = nota x d
                               |otherwise = Just c

--e) percFaltas :: Turma -> Float, que calcula a percentagem de alunos que faltaram à avaliação.
percFaltas :: Turma -> Float
percFaltas t = fromIntegral(nAlunos t) / fromIntegral(nFaltas t)
            
nFaltas :: Turma -> Int
nFaltas Empty = 0
nFaltas (Node (n,nome,r,c) e d) = case c of Faltou -> 1 + nFaltas e + nFaltas d
                                            otherwise -> 0

nAlunos :: Turma -> Int
nAlunos Empty = 0
nAlunos (Node r e d) = 1 + nAlunos e + nAlunos d

--f) mediaAprov :: Turma -> Float, que calcula a média das notas dos alunos que passaram.
mediaAprov :: Turma -> Float
mediaAprov t = fromIntegral(somaNotas t) / fromIntegral(nAlunos t)

somaNotas :: Turma -> Int
somaNotas Empty = 0
somaNotas (Node (n,nome,r,c) e d) = case c of Aprov nota -> nota + somaNotas e + somaNotas d
                                              otherwise -> 0 + somaNotas e + somaNotas d



















