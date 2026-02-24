-- Dupla: Melissa MM Souza 19.2.8112 Felipe Victor 19.2.8121
-- Disciplina: CSI107 - Linguagens de Programação [cite: 1]

module InterpretadorProlog where

--------------------------------------------------------------------------------
-- 1. Definição de Tipos de Dados (Requisito 1.1 e 1.3)
--------------------------------------------------------------------------------

-- Os termos são formados exclusivamente por átomos (variáveis proposicionais)[cite: 10, 11].
type Atom = String 

-- Cláusulas de Horn: Cabeça e Corpo (lista de átomos)[cite: 14, 15].
-- Fatos são representados como cláusulas com corpo vazio [][cite: 17, 18].
data Clause = Clause Atom [Atom] 
            deriving (Show, Eq) [cite: 49]

-- Um programa é um conjunto finito de cláusulas[cite: 19, 20].
type Program = [Clause] [cite: 50]

-- Uma consulta é uma sequência finita de átomos[cite: 26, 27].
type Query = [Atom] [cite: 51]

--------------------------------------------------------------------------------
-- 2. Mecanismo de Resolução SLD (Requisito 1.2 e 1.3)
--------------------------------------------------------------------------------

-- | Função que enumera todas as provas possíveis (Backtracking Exaustivo).
-- Implementa a seleção do primeiro literal e a substituição da meta[cite: 38, 40].
-- O uso da mônada de lista ([]) permite a enumeração de múltiplas soluções[cite: 44].
solveAll :: Program -> Query -> [Bool]
solveAll _ [] = [True] -- Meta vazia indica sucesso na derivação[cite: 41].
solveAll prog (a:as) = do
    -- Busca cláusulas cujo cabeçalho coincide com o literal selecionado 'a'[cite: 39].
    body <- [b | Clause head b <- prog, head == a]
    
    -- Substituição da meta pelo corpo seguido das metas restantes[cite: 40].
    -- Repete o processo recursivamente[cite: 41].
    solveAll prog (body ++ as)

-- | Função principal do interpretador.
-- Retorna True se a consulta for consequência lógica (pelo menos uma prova existe)[cite: 52, 53].
solve :: Program -> Query -> Bool
solve prog q = case (solveAll prog q) of
    [] -> False
    _  -> True

--------------------------------------------------------------------------------
-- 3. Exemplos de Teste (Requisito 4)
--------------------------------------------------------------------------------

-- Exemplo 1: Sucesso simples por fato (chovendo.)
prog1 :: Program
prog1 = [Clause "chovendo" []] [cite: 55]

query1 :: Query
query1 = ["chovendo"] -- Esperado: True [cite: 55]

-- Exemplo 2: Resolução por regra encadeada (bom :- sol. sol.)
prog2 :: Program
prog2 = [ Clause "bom" ["sol"]
        , Clause "sol" []
        ] [cite: 55]

query2 :: Query
query2 = ["bom"] -- Esperado: True [cite: 55]

-- Exemplo 3: Falha por ausência de informação (não existe regra para 'nevando')
prog3 :: Program
prog3 = [Clause "nublado" []] [cite: 55]

query3 :: Query
query3 = ["nevando"] -- Esperado: False [cite: 55]

-- Função para validar todos os requisitos no GHCi
executarTestes :: [Bool]
executarTestes = [ solve prog1 query1
                 , solve prog2 query2
                 , solve prog3 query3
                 ]