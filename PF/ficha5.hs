import Data.List

--Ex.1
--a) any :: (a -> Bool) -> [a] -> Bool que teste se um predicado é verdade para algum elemento de uma lista; por exemplo: any odd [1..10] == True
any' :: (a -> Bool) -> [a] -> Bool
any' _ [] = False
any' p (h:t) | p h = True
             | otherwise = any' p t

--b) zipWith :: (a->b->c) -> [a] -> [b] -> [c] que combina os elementos de duas listas usando uma função específica; por exemplo: zipWith (+) [1,2,3,4,5] [10,20,30,40] == [11,22,33,44].
zipWith' :: (a->b->c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' s (h1:t1) (h2:t2) = s h1 h2 : zipWith' s t1 t2

--c) takeWhile :: (a->Bool) -> [a] -> [a] que determina os primeiros elementos da lista que satisfazem um dado predicado; por exemplo: takeWhile odd [1,3,4,5,6,6] == [1,3].
takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' _ [] = []
takeWhile' p (h:t) | p h = h : takeWhile' p t
                   | otherwise = takeWhile' p t

--d) dropWhile :: (a->Bool) -> [a] -> [a] que elimina os primeiros elementos da lista que satisfazem um dado predicado; por exemplo: dropWhile odd [1,3,4,5,6,6] == [4,5,6,6].
dropWhile' :: (a -> Bool) -> [a] -> [a]
dropWhile' _ [] = []
dropWhile' p (h:t) | p h = dropWhile' p t
                   | otherwise = h : dropWhile' p t

--e) span :: (a-> Bool) -> [a] -> ([a],[a]), que calcula simultaneamente os dois resultados anteriores. Note que apesar de poder ser definida à custa das outras duas, usando a definição span p l = (takeWhile p l, dropWhile p l)
span' :: (a-> Bool) -> [a] -> ([a],[a])
span' _ [] = ([],[])
span' p l = (takeWhile' p l, dropWhile' p l) 

--f) deleteBy :: (a -> a -> Bool) -> a -> [a] -> [a] que apaga o primeiro elemento de uma lista que é “igual” a um dado elemento de acordo com a função de comparação que é passada como parâmetro. Por exemplo: deleteBy (\x y -> snd x == snd y) (1,2) [(3,3),(2,2),(4,2)]
deleteBy' :: (a -> a -> Bool) -> a -> [a] -> [a]
deleteBy' _ _ [] = []
deleteBy' f x (h:t) | f x h = t
                    | otherwise = h : deleteBy' f x t

--g) sortOn :: Ord b => (a -> b) -> [a] -> [a] que ordena uma lista comparando os resultados de aplicar uma função de extracção de uma chave a cada elemento de uma lista. Por exemplo: sortOn fst [(3,1),(1,2),(2,5)] == [(1,2),(2,5),(3,1)].
sortOn' :: Ord b => (a -> b) -> [a] -> [a]
sortOn' f = sortBy (\x y -> compare (f x) (f y))


--Ex.2
type Polinomio = [Monomio]
type Monomio = (Float, Int)

--a) selgrau :: Int -> Polinomio -> Polinomio que selecciona os monómios com um dado grau de um polinómio.
selgrau :: Int -> Polinomio -> Polinomio
selgrau _ [] = []
selgrau x ((n,g):t) = if x == g then (n, g) : selgrau x t else selgrau x t 

--b) conta :: Int -> Polinomio -> Int de forma a que (conta n p) indica quantos monómios de grau n existem em p.
conta :: Int -> Polinomio -> Int
conta _ [] = 0
conta x ((n,g):t) | x == g = c + 1 
                  | otherwise = c
                  where
                    c = conta x t

--c) grau :: Polinomio -> Int que indica o grau de um polinómio.
grau :: Polinomio -> Int
grau [] = 0
grau ((n,g):t) | g > c = c + (g - c)
               | otherwise = grau t
               where
                c = grau t

--d) deriv :: Polinomio -> Polinomio que calcula a derivada de um polinómio.
deriv :: Polinomio -> Polinomio
deriv [] = []
deriv ((n,g):t) = (n * fromIntegral g, g - 1)  : deriv t

--e) calcula :: Float -> Polinomio -> Float que calcula o valor de um polinómio para uma dado valor de x.
calcula :: Float -> Polinomio -> Float
calcula _ [] = 0.0
calcula x ((n,g):t) = (x * n)^2 + calcula x t

--f) simp :: Polinomio -> Polinomio que retira de um polinómio os monómios de coeficiente zero.
simp :: Polinomio -> Polinomio
simp [] = []
simp ((n,g):t) = if n == 0 then simp t else (n,g) : simp t

--g) mult :: Monomio -> Polinomio -> Polinomio que calcula o resultado da multiplicação de um monómio por um polinómio.
mult :: Monomio -> Polinomio -> Polinomio
mult _ [] = []
mult (n1,g1) ((n2,g2):t) = (n1 * n2, g1 + g2) : mult (n1,g1) t

--h) ordena :: Polinomio -> Polinomio que ordena um polonómio por ordem crescente dos graus dos seus monómios.
ordena :: Polinomio -> Polinomio
ordena [] = []
ordena [x] = [x]
ordena p = sortBy (\(_,g1) (_,g2) -> compare g1 g2) p

--i) normaliza :: Polinomio -> Polinomio que dado um polinómio constói um polinómio equivalente em que não podem aparecer varios monómios com o mesmo grau.
normaliza :: Polinomio -> Polinomio
normaliza [] = []
normaliza (p:t) = adicionaMonomio p (normaliza t)

adicionaMonomio :: Monomio -> Polinomio -> Polinomio
adicionaMonomio (n,g) [] = [(n,g)]
adicionaMonomio (n1, g1) ((n2, g2):t) | g1 == g2 = (n2 + n1, g1) : t
                                      | otherwise = (n2, g2) : adicionaMonomio (n1,g1) t

--j) equiv :: Polinomio -> Polinomio -> Bool que testa se dois polinómios são equivalentes.
equiv :: Polinomio -> Polinomio -> Bool
equiv p1 p2 = if normaliza p1 == normaliza p2 then True else False

--Ex.3
type Mat a = [[a]]

--a) dimOK :: Mat a -> Bool que testa se uma matriz está bem construída (i.e., se todas as linhas têm a mesma dimensão).
dimOK :: Mat a -> Bool
dimOK m = all (==dim) (map length m)
        where
          dim = case m of
            [] -> 0
            (h:t) -> length h

--b) dimMat :: Mat a -> (Int,Int) que calcula a dimensão de uma matriz. 
dimMat :: Mat a -> (Int, Int)
dimMat [] = (0, 0)
dimMat (h:t) = (contaLinha (h:t), length h)

contaLinha :: Mat a -> Int
contaLinha [] = 0
contaLinha (h:t) = 1 + contaLinha t



