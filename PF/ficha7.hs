--Ex.1
data ExpInt = Const Int
            | Simetrico ExpInt
            | Mais ExpInt ExpInt
            | Menos ExpInt ExpInt
            | Mult ExpInt ExpInt

--a) Defina uma função calcula :: ExpInt -> Int que, dada uma destas expressões calcula o seu valor.
calcula :: ExpInt -> Int
calcula (Const x) = x
calcula (Simetrico x) = - calcula x
calcula (Mais x y) = calcula x + calcula y
calcula (Menos x y) = calcula x - calcula y
calcula (Mult x y) = calcula x * calcula y

--b) Defina uma função infixa :: ExpInt -> String de forma a que infixa (Mais (Const 3) (Menos (Const 2) (Const 5))) dê como resultado "(3 + (2 - 5))".
infixa :: ExpInt -> String
infixa (Const x) = show x
infixa (Simetrico x) = '-' : '(' :  infixa x ++ ")"
infixa (Mais x y) = '(' : infixa x ++ " + " ++ infixa y ++ ")"
infixa (Menos x y) = '(' : infixa x ++ " - " ++ infixa y ++ ")"
infixa (Mult x y) = '(' : infixa x ++ " * " ++ infixa y ++ ")"

--c)  Defina uma outra função de conversão para strings posfixa :: ExpInt -> String de forma a que quando aplicada à expressão acima dê como resultado "3 2 5 -+".
posfixa :: ExpInt -> String
posfixa (Const x) = show x
posfixa (Simetrico x) = posfixa x ++ " -"
posfixa (Mais x y) = posfixa x ++ " " ++  posfixa y ++ " +"
posfixa (Menos x y) = posfixa x ++ " " ++ posfixa y ++ " -"
posfixa (Mult x y) = posfixa x ++ " " ++ posfixa y ++ " *"

--Ex.2
data RTree a = R a [RTree a]

--a) soma :: Num a => RTree a -> a que soma os elementos da árvore.
soma :: Num a => RTree a -> a
soma (R r []) = r
soma (R r l) = r + sum (map soma l)

--b) altura :: RTree a -> Int que calcula a altura da árvore.
altura :: RTree a -> Int
altura (R r []) = 0
altura (R r l) = 1 + maximum (map altura l)

--c) prune :: Int -> RTree a -> RTree a que remove de uma árvore todos os elementos a partir de uma determinada profundidade.
prune :: Int -> RTree a -> RTree a
prune _ (R r []) = (R r [])
prune 0 (R r _) = (R r [])
prune x (R r l) = (R r (map (prune (x - 1)) l))

--d) mirror :: RTree a -> RTree a que gera a árvore simétrica.
mirror :: RTree a -> RTree a
mirror (R r l) =  (R r (map mirror(reverse l)))

--e) postorder :: RTree a -> [a] que corresponde à travessia postorder da árvore.
postorder :: RTree a -> [a]
postorder (R r l) = concat (map postorder l) ++ [r]

--Ex.3
data BTree a = Empty | Node a (BTree a) (BTree a)
data LTree a = Tip a | Fork (LTree a) (LTree a)

--a) ltSum :: Num a => LTree a -> a que soma as folhas de uma árvore.
ltSum :: Num a => LTree a -> a
ltSum (Tip x) = x
ltSum (Fork e d) = ltSum e + ltSum d

--b) listaLT :: LTree a -> [a] que lista as folhas de uma árvore (da esquerda para a direita).
listaLT :: LTree a -> [a]
listaLT (Tip x) = [x]
listaLT (Fork e d) = listaLT e ++ listaLT d 

--c) ltHeight :: LTree a -> Int que calcula a altura de uma árvore.
ltHeight :: LTree a -> Int
ltHeight (Tip x) = 1
ltHeight (Fork e d) = 1 + max (ltHeight e) (ltHeight d)

--Ex.4
data FTree a b = Leaf b | No a (FTree a b) (FTree a b)

--a) Defina a função splitFTree :: FTree a b -> (BTree a, LTree b) que separa uma árvore com informação nos nodos e nas folhas em duas árvores de tipos diferentes.
splitFTree :: FTree a b -> (BTree a, LTree b)
splitFTree (Leaf x) = (Empty, Tip x)
splitFTree (No r e d) = ((Node r bte btd), (Fork lte ltd)) 
                      where
                        (bte, lte) = splitFTree e
                        (btd, ltd) = splitFTree d 

--b) Defina ainda a função joinTrees :: BTree a -> LTree b -> Maybe (FTree a b) que sempre que as árvores sejam compatíveis as junta numa só.
joinTrees :: BTree a -> LTree b -> Maybe (FTree a b)
joinTrees (Node r bte btd) (Fork lte ltd) = Just (No r aux1 aux2)
                                          where
                                            Just aux1 = joinTrees bte lte
                                            Just aux2 = joinTrees btd ltd
joinTrees _ _ = Nothing





