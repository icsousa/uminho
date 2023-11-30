import Data.Char

--Ex.1
--a) Considere a seguinte definição:
funA :: [Double] -> Double
funA [] = 0
funA (y:ys) = y^2 + (funA ys)
-- Diga, justificando, qual é o valor de funA [2,3,5,1].
-- R.: O valor da funA [2,3,5,1] é de (4 + 9 + 25 + 1) = 39, pois a funA pega em todos os elementos da lista e eleva-os ao quadrado e soma-os.

--b) Considere seguinte definição:
funB :: [Int] -> [Int]
funB [] = []
funB (h:t) = if (mod h 2)==0 then h : (funB t) else (funB t)
-- Diga, justificando, qual é o valor de funB [8,5,12].
-- R.: O valor da funB [8,5,12] é de (8,12), porque a funB verifica se o primeiro elemento da lista é par e se sim adiciona-o à lista, se não, apenas o remove.

--c) Considere a seguinte definição:
funC (x:y:t) = funC t
funC [x] = [x]
funC [] = []
-- Diga, justificando, qual é o valor de funC [1,2,3,4,5].
-- R.: O valor da funC [1,2,3,4,5] é [], porque a funC pega em qualquer lista e tranforma-a em uma lista vazia.

--d) Considere a seguinte definição:
funD l = g [] l
g acc [] = acc
g acc (h:t) = g (h:acc) t
--Diga, justificando, qual é o valor de funD "otrec".
-- R.: O valor da funD "otrec" é "otrec", pois como o acc é [], não se vai alterar nada.

--Ex.2
--a) dobros :: [Float] -> [Float] que recebe uma lista e produz a lista em que cada elemento é o dobro do valor correspondente na lista de entrada
dobros :: [Float] -> [Float]
dobros [] = []
dobros (h:t) = h * 2 : dobros t 

--b) numOcorre :: Char -> String -> Int que calcula o número de vezes que um caracter ocorre numa string.
numOcorre :: Char -> String -> Int
numOcorre c [] = 0
numOcorre c (h:t) = if c == h then 1 + numOcorre c t else numOcorre c t

--c) positivos :: [Int] -> Bool que testa se uma lista só tem elementos positivos.
positivos :: [Int] -> Bool 
positivos [] = True
positivos (h:t) = if h > 0 then positivos t else False

--d) soPos :: [Int] -> [Int] que retira todos os elementos não positivos de uma lista de inteiros.
soPos :: [Int] -> [Int]
soPos [] = []
soPos (h:t) = if h >= 0 then h : soPos t else soPos t

--e) somaNeg :: [Int] -> Int que soma todos os números negativos da lista de entrada.
somaNeg :: [Int] -> Int
somaNeg [] = 0
somaNeg (h:t) = if h < 0 then h + somaNeg t else somaNeg t

--f) tresUlt :: [a] -> [a] devolve os últimos três elementos de uma lista. Se a lista de entrada tiver menos de três elementos, devolve a própria lista.
tresUlt :: [a] -> [a]
tresUlt (x:y:z:w:t) = tresUlt (y:z:w:t)
tresUlt l = l

--g) segundos :: [(a,b)] -> [b] que calcula a lista das segundas componentes dos pares.
segundos :: [(a,b)] -> [b]
segundos [] = []
segundos ((x,y):t) = y : segundos t

--h) nosPrimeiros :: (Eq a) => a -> [(a,b)] -> Bool que testa se um elemento aparece na lista como primeira componente de algum dos pares.
nosPrimeiros :: (Eq a) => a -> [(a,b)] -> Bool
nosPrimeiros x [] = False
nosPrimeiros x ((n,m):t) = if x == n then True else nosPrimeiros x t

--i) sumTriplos :: (Num a, Num b, Num c) => [(a,b,c)] -> (a,b,c) soma uma lista de triplos componente a componente. Por exemplo, sumTriplos [(2,4,11), (3,1,-5), (10,-3,6)] = (15,2,12)
sumTriplos :: (Num a, Num b, Num c) => [(a,b,c)] -> (a,b,c)
sumTriplos [] = (0,0,0)
sumTriplos ((x,y,z):t) = (x + i, y + j, z + k)
                       where (i,j,k) = sumTriplos t

--Ex.3
--a) soDigitos :: [Char] -> [Char] que recebe uma lista de caracteres, e selecciona dessa lista os caracteres que são algarismos.
soDigitos :: [Char] -> [Char]
soDigitos [] = []
soDigitos (h:t) = if isDigit h then h : soDigitos t else soDigitos t

--b) minusculas :: [Char] -> Int que recebe uma lista de caracteres, e conta quantos desses caracteres são letras minúsculas.
minusculas :: [Char] -> Int
minusculas [] = 0
minusculas (h:t) = if isLower h then 1 + minusculas t else  minusculas t

--c) nums :: String -> [Int] que recebe uma string e devolve uma lista com os algarismos que ocorrem nessa string, pela mesma ordem.
nums :: String -> [Int]
nums [] = []
nums (h:t) = if elem h ['0'..'9'] then (ord 'h' - ord '0') : nums t  else nums t

--Ex.4
type Polinomio = [Monomio]
type Monomio = (Float,Int)

--a) conta :: Int -> Polinomio -> Int de forma a que (conta n p) indica quantos monómios de grau n existem em p.
conta :: Int -> Polinomio -> Int
conta n [] = 0
conta n ((x,m):t) = if n == m then 1 + conta n t else conta n t

--b) grau :: Polinomio -> Int que indica o grau de um polinómio.
grau :: Polinomio -> Int
grau [] = 0
grau [(x1,m1)] = m1
grau ((x1,m1):(x2,m2):t) = if m1 < m2 then grau ((x2,m2):t) else grau ((x1,m1):t)

--c) selgrau :: Int -> Polinomio -> Polinomio que selecciona os monómios com um dado grau de um polinómio.
selgrau :: Int -> Polinomio -> Polinomio
selgrau n [] = []
selgrau n ((x1,m1):t) = if n == m1 then (x1,m1) : selgrau n t else selgrau n t

--d) deriv :: Polinomio -> Polinomio que calcula a derivada de um polinómio.
deriv :: Polinomio -> Polinomio
deriv [] = []
deriv ((x,m):t) = if m > 0 then (x * fromIntegral m, m - 1) : deriv t else (x,m) : deriv t

--e) calcula :: Float -> Polinomio -> Float que calcula o valor de um polinómio para uma dado valor de x.
calcula :: Float -> Polinomio -> Float
calcula y [] = 0
calcula y ((x,m):t) = y ^ m * x + calcula y t

--f) simp :: Polinomio -> Polinomio que retira de um polinómio os monómios de coeficiente zero.
simp :: Polinomio -> Polinomio
simp [] = []
simp ((x,m):t) = if m /= 0 then (x,m) : simp t else simp t

--g) mult :: Monomio -> Polinomio -> Polinomio que calcula o resultado da multiplicação de um monómio por um polinómio.
mult :: Monomio -> Polinomio -> Polinomio
mult _ [] = []
mult (y,n) ((x,m):t) = (y * x, n * m) : mult (y,n) t 

--h) normaliza :: Polinomio -> Polinomio que dado um polinómio constrói um polinómio equivalente em que não podem aparecer varios monómios com o mesmo grau.
normaliza :: Polinomio -> Polinomio
normaliza [] = []
normaliza ((n1,g1):t) = let lgi = selgrau g1 t
                            lgd = selgrau g1 t
                            x2 = sumRep ((n1,g1):lgi)
                            in if(x2==0) then normaliza lgd else (x2,g1):(normaliza lgd)

sumRep :: Polinomio -> Float
sumRep [] = 0
sumRep ((n1,g1):t) = n1 + sumRep t

--i) soma :: Polinomio -> Polinomio -> Polinomio que soma dois polinómios de forma a que se os polinómios que recebe estiverem normalizados produz também um polinómio normalizado.
soma :: Polinomio -> Polinomio -> Polinomio
soma p1 p2 = normaliza (p1++p2)

--j) produto :: Polinomio -> Polinomio -> Polinomio que calcula o produto de dois polinómios
produto :: Polinomio -> Polinomio -> Polinomio
produto _ [] = []
produto [] _ = []
produto (p:t) p2 = mult p p2 ++ produto t p2

--k) ordena :: Polinomio -> Polinomio que ordena um polinómio por ordem crescente dos graus dos seus monómios.
ordena :: Polinomio -> Polinomio
ordena [] = []
ordena ((n1,g1):t) = insertP (n1,g1) (ordena t)
                     where insertP :: Monomio -> Polinomio -> Polinomio
                           insertP (n1,g1) [] = [(n1,g1)]
                           insertP (n1,g1) ((n2,g2):t) = if g1 < g2 then (n1,g1):((n2,g2):t) else (n2,g2) : insertP (n1,g1) t

--l) equiv :: Polinomio -> Polinomio -> Bool que testa se dois polinómios são equivalentes.
equiv :: Polinomio -> Polinomio -> Bool
equiv p1 p2 = ordena(normaliza p1) == ordena(normaliza p2)
