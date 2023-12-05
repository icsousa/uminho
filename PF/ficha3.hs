import Data.Char
import Data.List

--Ex.1
data Hora = H Int Int
          deriving Show
type Etapa = (Hora,Hora)
type Viagem = [Etapa]

--a) Testar se uma etapa está bem construída (i.e., o tempo de chegada é superior ao de partida e as horas são válidas).
testarEtapa :: Etapa -> Bool
testarEtapa (H h1 m1, H h2 m2) | h1 > h2 = True
                               | h1 == h2 && m1 > m2 = True
                               | otherwise = False

--b) Testa se uma viagem está bem construída (i.e., se para cada etapa, o tempo de chegada é superior ao de partida, e se a etapa seguinte começa depois da etapa anterior ter terminado).
testarViagem :: Viagem -> Bool
testarViagem [] = False
testarViagem ((H h1 m1, H h2 m2):(H h3 m3, H h4 m4):t) = if testarEtapa (H h1 m1, H h2 m2) && testarEtapa (H h3 m1, H h4 m4) && testarEtapa (H h2 m2, H h3 m3) then True else testarViagem ((H h3 m3, H h4 m4):t)

--c) Calcular a hora de partida e de chegada de uma dada viagem.
calcularH :: Viagem -> Etapa
calcularH [e] = e
calcularH v = (fst (head v), snd (last v))

--d) Dada uma viagem válida, calcular o tempo total de viagem efectiva.
converterHparaM :: Hora -> Int
converterHparaM (H h m) = h * 60 + m

tempoViagem :: Viagem -> Int
tempoViagem [] = 0
tempoViagem ((H h1 m1, H h2 m2):t) = (converterHparaM(H h2 m2) - converterHparaM(H h1 m1)) + tempoViagem t

--e)  Calcular o tempo total de espera.
tempoEspera :: Viagem -> Int
tempoEspera [] = 0
tempoEspera ((H h1 m1, H h2 m2):(H h3 m3, H h4 m4):t) = (converterHparaM (H h3 m3) - converterHparaM (H h2 m2)) + tempoEspera ((H h3 m3, H h4 m4):t)

--f) Calcular o tempo total da viagem (a soma dos tempos de espera e de viagem efectiva).
tempoTotal :: Viagem -> Int
tempoTotal v = tempoViagem v + tempoEspera v

--Ex.3
data Contacto = Casa Integer
              | Trab Integer
              | Tlm Integer
              | Email String
              deriving Show
type Nome = String
type Agenda = [(Nome, [Contacto])]

--a) Defina a função acrescEmail :: Nome -> String -> Agenda -> Agenda que, dado um nome, um email e uma agenda, acrescenta essa informação à agenda.
acrescEmail :: Nome -> String -> Agenda -> Agenda
acrescEmail nome email agenda = agenda ++ [(nome, [Email email])]

--b) Defina a função verEmails :: Nome -> Agenda -> Maybe [String] que, dado um nome e uma agenda, retorna a lista dos emails associados a esse nome. Se esse nome não existir na agenda a função deve retornar Nothing
verEmails :: Nome -> Agenda -> Maybe [String]
verEmails nome1 [(nome2, cont)] = if nome1 == nome2 then Just (map(\x -> case x of Email e -> e) cont) else Nothing
verEmails nome ((nom,cont): agenda) = if nome == nom then verEmails nome [(nom,cont)] else verEmails nome agenda

--c) Defina a função consTelefs :: [Contacto] -> [Integer] que, dada uma lista de contactos, retorna a lista de todos os números de telefone dessa lista (tanto telefones fixos como telemóveis).
consTelefs :: [Contacto] -> [Integer]
consTelefs [] = []
consTelefs (h:t) = case h of Casa c -> c : consTelefs t
                             Trab c -> c : consTelefs t
                             Tlm c -> c : consTelefs t
                             otherwise -> consTelefs t

--d) Defina a função casa :: Nome -> Agenda -> Maybe Integer que, dado um nome e uma agenda, retorna o número de telefone de casa (caso exista).
casa :: Nome -> Agenda -> Maybe Integer
casa nome [(n,(c:cs))] = if nome == n then case c of Casa x -> Just x
                                                     otherwise -> casa nome [(n,cs)] 
                                      else Nothing
casa nome ((n,c):agenda) = if nome == n then casa nome [(n,c)] else casa nome agenda

--Ex.4
type Dia = Int
type Mes = Int
type Ano = Int
data Data = D Dia Mes Ano
          deriving Show
type TabDN = [(Nome,Data)]

--a) Defina a função procura :: Nome -> TabDN -> Maybe Data, que indica a data de nascimento de uma dada pessoa, caso o seu nome exista na tabela.
procura :: Nome -> TabDN -> Maybe Data
procura nome ((n, d):tabDn) = if nome == n then Just d else procura nome tabDn

--b) Defina a função idade :: Data -> Nome -> TabDN -> Maybe Int, que calcula a idade de uma pessoa numa dada data.
idade :: Data -> Nome -> TabDN -> Maybe Int
idade (D d1 m1 a1) nome ((n, D d2 m2 a2):t) | nome /= n = idade (D d1 m1 a1) nome t
                                            | a1 < a2 || (a1 == a2 && m1 < m2) = Just 0
                                            | m1 < m2 || (m1 == m2 && d1 < d2) = Just (a1 - a2 - 1)
                                            | otherwise = Just (a1 - a2)

--c) Defina a função anterior :: Data -> Data -> Bool, que testa se uma data é anterior a outra data.
anterior :: Data -> Data -> Bool
anterior (D d1 m1 a1) (D d2 m2 a2) | a1 < a2 = True
                                   | m1 < m2 = True
                                   | d1 < d2 = True
                                   | otherwise = False

--d) Defina a função ordena :: TabDN -> TabDN, que ordena uma tabela de datas de nascimento, por ordem crescente das datas de nascimento.
ordena :: TabDN -> TabDN
ordena [] = []
ordena ((nom,dat):t) = aux (nom,dat)  (ordena t)
                       where aux (no,da) [] = [(no,da)]
                             aux (no,da) ((n,d):t) = if (anterior da d) == False then (n,d) : aux (no,da) t else (no,da) : aux (n,d) t

--e) Defina a função porIdade:: Data -> TabDN -> [(Nome,Int)], que apresenta o nome e a idade das pessoas, numa dada data, por ordem crescente da idade das pessoas.
porIdade:: Data -> TabDN -> [(Nome,Int)]
porIdade _ [] = []
porIdade (D d1 m1 a1) tabDn = (nome, idade) : porIdade (D d1 m1 a1) tabDn
                                where ((nome, (D d2 m2 a2)):t) = ordena tabDn
                                      idade = if (m1 < m2 || (m1 == m2 && d1 < d1)) then (a1 - a2 - 1) else (a1 - a2)


