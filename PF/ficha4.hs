import Data.Char
import Data.List

--Ex.1 - Defina a função digitAlpha :: String -> (String,String), que dada uma string, devolve um par de strings: uma apenas com as letras presentes nessa string, e a outra apenas com os números presentes na string. Implemente a função de modo a fazer uma única travessia da string. Relembre que as funções isDigit,isAlpha :: Char -> Bool estão já definidas no módulo Data.Char.
digitAlpha :: String -> (String, String)
digitAlpha [] = ("", "")
digitAlpha (h:t) | isDigit h = (l, h:n) 
                 | isAlpha h = (h:l, n)
                 | otherwise = (l, n)
                 where
                    (l, n) = digitAlpha t

--Ex.2 - Defina a função nzp :: [Int] -> (Int,Int,Int) que, dada uma lista de inteiros, conta o número de valores nagativos, o número de zeros e o número de valores positivos, devolvendo um triplo com essa informação. Certifique-se que a função que definiu percorre a lista apenas uma vez.
nzp :: [Int] -> (Int, Int, Int)
nzp [] = (0, 0, 0)
nzp (h:t) | h < 0 = (n + 1, z, p)
          | h == 0 = (n, z + 1, p)
          | otherwise = (n, z, p + 1)
          where
            (n, z, p) = nzp t

--Ex.3 - Defina a função divMod :: Integral a => a -> a -> (a, a) que calcula simultaneamente a divisão e o resto da divisão inteira por subtracções sucessivas.



