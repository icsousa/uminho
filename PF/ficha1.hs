import Data.Char
import Data.List

--Ex.1
--a) perimetro – que calcula o perímetro de uma circunferência, dado o comprimento do seu raio.
perimetro :: Float -> Float
perimetro x = 2 * pi * x

--b) dist – que calcula a distância entre dois pontos no plano Cartesiano. Cada ponto é um par de valores do tipo Double.
dist :: (Double, Double) -> (Double, Double) -> Double
dist (x1, y1) (x2, y2) = sqrt((x2 - x1) ^ 2 + (y2 - y1)^2)

--c) primUlt – que recebe uma lista e devolve um par com o primeiro e o último elemento dessa lista.
primUlt :: [a] -> (a, a)
primUlt l = (head l, last l)

--d) multiplo – tal que multiplo m n testa se o número inteiro m é múltiplo de n.
multiplo :: Int -> Int -> Bool
multiplo m n = if mod m n == 0 then True else False

--e) truncaImpar – que recebe uma lista e, se o comprimento da lista for ímpar retiralhe o primeiro elemento, caso contrário devolve a própria lista.
truncaImpar :: [a] -> [a]
truncaImpar l = if mod (length l) 2 == 0 then l else tail l

--f) max2 – que calcula o maior de dois números inteiros
max2 :: Int -> Int -> Int
max2 x y = if x >= y then x else y

--g) max3 – que calcula o maior de três números inteiros, usando a função max2.
max3 :: Int -> Int -> Int -> Int
max3 x y z = max2 (max2 x y) z  

--Ex.2
--a) A função nRaizes que recebe os (3) coeficientes de um polinómio de 2o grau e que calcula o número de raízes (reais) desse polinómio.
nRaizes :: Float -> Float -> Float -> Int
nRaizes x y z | result < 0 = 0
              | result == 0 = 1
              | result > 0 = 2
              where result = (y) ^ 2 - 4 * x * z

--b)  A função raizes que, usando a função anterior, recebe os coeficientes do polinómio e calcula a lista das suas raízes reais.
raizes :: Float -> Float -> Float -> [Float]
raizes x y z | result < 0 = [0]
             | result == 0 = [r]
             | result > 0 = [r1, r2]
             where 
                result = (y) ^ 2 - 4 * x * z
                r = (- y) / 2 * x
                r1 = ((- y) - sqrt(result)) / 2 * x
                r2 = ((- y) + sqrt(result)) / 2 * x

--Ex.3
type Hora = (Int, Int)

--a) testar se um par de inteiros representa uma hora do dia válida;
horaValida :: Hora -> Bool
horaValida (h, m) = if h > 24 || m > 60 then False else True

--b) testar se uma hora é ou não depois de outra (comparação);
horaDepois :: Hora -> Hora -> Bool
horaDepois (h1, m1) (h2, m2) | h1 > h2 = False
                             | h1 == h2 && m1 > m2 || m1 == m2 = False
                             | otherwise = True

--c) converter um valor em horas (par de inteiros) para minutos (inteiro);
convHorasToMin :: Hora -> Int
convHorasToMin (h, m) = h * 60 + m

--d) converter um valor em minutos para horas;
convMinToHoras :: Int -> Hora
convMinToHoras min = (div min 60, mod min 60)

--e) calcular a diferença entre duas horas (cujo resultado deve ser o número de minutos);
difHorasEmMin :: Hora -> Hora -> Int
difHorasEmMin (h1, m1) (h2, m2) = abs(convHorasToMin (h1, m1) - convHorasToMin (h2, m2))

--f) adicionar um determinado número de minutos a uma dada hora.
adMinToHora :: Hora -> Int -> Hora
adMinToHora (h, m) min = convMinToHoras(convHorasToMin (h, m) + min)

--Ex.4
data Hora' = H Int Int deriving (Show,Eq)

--a) testar se um par de inteiros representa uma hora do dia válida;
horaValidaH :: Hora' -> Bool
horaValidaH (H h m) = if h > 24 || m > 60 then False else True

--b) testar se uma hora é ou não depois de outra (comparação);
horaDepoisH :: Hora' -> Hora' -> Bool
horaDepoisH (H h1 m1) (H h2 m2) | h1 > h2 = False
                                | h1 == h2 && m1 > m2 || m1 == m2 = False
                                | otherwise = True

--c) converter um valor em horas (par de inteiros) para minutos (inteiro);
convHorasToMinH :: Hora' -> Int
convHorasToMinH (H h m) = h * 60 + m

--d) converter um valor em minutos para horas;
convMinToHorasH :: Int -> Hora'
convMinToHorasH min = (H (div min 60) (mod min 60))

--e) calcular a diferença entre duas horas (cujo resultado deve ser o número de minutos);
difHorasEmMinH :: Hora' -> Hora' -> Int
difHorasEmMinH (H h1 m1) (H h2 m2) = abs(convHorasToMinH (H h1 m1) - convHorasToMinH (H h2 m2))

--f) adicionar um determinado número de minutos a uma dada hora.
adMinToHoraH :: Hora' -> Int -> Hora'
adMinToHoraH (H h m) min = convMinToHorasH(convHorasToMinH(H h m) + min)

--Ex.5
data Semaforo = Verde | Amarelo | Vermelho deriving (Show,Eq)

--a) Defina a função next :: Semaforo -> Semaforo que calcula o próximo estado de um semáforo.
next :: Semaforo -> Semaforo
next x | x == Verde = Vermelho
       | x == Vermelho = Amarelo
       | otherwise = Verde

--b) Defina a função stop :: Semaforo -> Bool que determina se é obrigatório parar num semáforo.
stop :: Semaforo -> Bool
stop x | x == Vermelho = True
       | otherwise = False

--c) Defina a função safe :: Semaforo -> Semaforo -> Bool que testa se o estado de dois semáforos num cruzamento é seguro.
safe :: Semaforo -> Semaforo -> Bool
safe x y | x == Vermelho && y == Verde = True
         | x == Verde && y == Vermelho = True
         | x == Vermelho && y == Amarelo = True
         | x == Amarelo && y == Vermelho = True
         | otherwise = False

--Ex.6
data Ponto = Cartesiano Double Double | Polar Double Double deriving (Show,Eq)

--a) posx :: Ponto -> Double que calcula a distância de um ponto ao eixo vertical.
posx :: Ponto -> Double
posx (Cartesiano x y) = x
posx (Polar d a) = d * cos(a)

--b) posy :: Ponto -> Double que calcula a distância de um ponto ao eixo horizontal.
posy :: Ponto -> Double
posy (Cartesiano x y) = y
posy (Polar d a) = d + sin(a)

--c) raio :: Ponto -> Double que calcula a distância de um ponto à origem.
raio :: Ponto -> Double
raio (Cartesiano x y) = sqrt(x ^ 2 + y ^ 2)
raio (Polar d a) = d

--d) angulo :: Ponto -> Double que calcula o ângulo entre o vector que liga a origem ao ponto e o eixo horizontal.
angulo :: Ponto -> Double
angulo (Cartesiano x y) |x == 0 && y == 0 = 0
                        |x == 0 && y > 0 = pi / 2
                        |x == 0 && y < 0 = -pi / 2
                        |x > 0 = atan (y/x)
                        |x < 0 && y >= 0 = atan (y / x) + pi
                        |x < 0 && y < 0 = atan (y / x) - pi
angulo (Polar d a) = a

--e) dist :: Ponto -> Ponto -> Double que calcula a distância entre dois pontos.
distP :: Ponto -> Ponto -> Double
distP (Cartesiano x1 y1) (Cartesiano x2 y2) = sqrt((x1 - x2) ^ 2 + (y1 - y2) ^ 2)
dist' (Polar d1 a1) (Polar d2 a2) = sqrt((px1 - px2) ^ 2 + (py1 - py2) ^ 2)
                                   where 
                                    px1 = d1 * cos a1
                                    px2 = d2 * cos a2
                                    py1 = d1 * sin a1
                                    py2 = d2 * sin a2

--Ex.7
data Figura = Circulo Ponto Double
            | Rectangulo Ponto Ponto
            | Triangulo Ponto Ponto Ponto
            deriving (Show,Eq)

--a) Defina a função poligono :: Figura -> Bool que testa se uma figura é um polígono.
poligono :: Figura -> Bool
poligono (Circulo a r) = if r > 0 then True else False
poligono (Rectangulo a b) = if (posx a) /= (posx b) && (posy a) /= (posy b) then True else False
poligono (Triangulo a b c) = ((x + y) > z) || ((x + z) > y) || ((y + z) > x)
                           where 
                            x = dist' a b
                            y = dist' a c
                            z = dist' b c

--b) Defina a função vertices :: Figura -> [Ponto] que calcula a lista dos vértices de uma figura.
vertices :: Figura -> [Ponto]
vertices (Circulo a r) = []
vertices (Rectangulo a b) = [Cartesiano x1 y1, Cartesiano x1 y2, Cartesiano x2 y1, Cartesiano x2 y2]
                          where 
                            x1 = (posx a)
                            x2 = (posx b)
                            y1 = (posy a)
                            y2 = (posy b)
vertices (Triangulo a b c) = [a,b,c]

--c) Complete a seguinte definição cujo objectivo é calcular a área de uma figura:
area :: Figura -> Double
area (Triangulo p1 p2 p3) = let a = dist' p1 p2
                                b = dist' p2 p3
                                c = dist' p3 p1
                                s = (a+b+c) / 2 -- semi-perimetro
                                in sqrt (s*(s-a)*(s-b)*(s-c)) -- formula de Heron
area (Circulo a r) = pi * (r)^2
area (Rectangulo a b) = if posx a > posy b then (posx a - posx b) * (posy a - posy b) else (posx b - posx a) * (posy b - posy a)  

--d) Defina a função perimetro :: Figura -> Double que calcula o perímetro de uma figura.
perimetro' :: Figura -> Double
perimetro' (Circulo a r) = 2 * pi * r
perimetro' (Rectangulo a b) = 2 * (((abs (posx a)) + (abs(posx b))) + ((abs (posy a)) + (abs(posy b))))
perimetro' (Triangulo a b c) = let p1 = dist' a b
                                   p2 = dist' b c
                                   p3 = dist' c a
                               in  p1 + p2 + p3

--Ex.8
--a)  isLower :: Char -> Bool, que testa se um Char é uma minúscula
isLowerChar :: Char -> Bool
isLowerChar c = if ord(c) >= 95 && ord(c) <= 122 then True else False

--b) isDigit :: Char -> Bool, que testa se um Char é um dígito.
isDigitChar :: Char -> Bool
isDigitChar c = if elem c ['0'..'9'] then True else False

--c) isAlpha :: Char -> Bool, que testa se um Char é uma letra.
isAlphaChar :: Char -> Bool
isAlphaChar c = if isLower c || elem c ['A'..'Z'] then True else False

--d) toUpper :: Char -> Char, que converte uma letra para a respectiva maiúscula.
toUpperChar :: Char -> Char
toUpperChar c = if isLower c == True then chr (ord(c) - 32) else c

--e) intToDigit :: Int -> Char, que converte um número entre 0 e 9 para o respectivo dígito.
intToDigitChar :: Int -> Char
intToDigitChar c = if elem c [0..9] then chr( ord('0') + c) else error ""

--f) digitToInt :: Char -> Int, que converte um dígito para o respectivo inteiro.
digitToIntChar :: Char -> Int
digitToIntChar c = if isAlpha c == True then (ord c - ord '0') else error ""