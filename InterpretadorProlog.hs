--------------------------------------------------------------------------------
-- Dupla: Melissa MM Souza (19.2.8112) e Felipe Victor (19.2.8121)
-- Disciplina: CSI107 - Linguagens de Programação
-- Trabalho Prático: Interpretador Prolog Proposicional
--------------------------------------------------------------------------------

module InterpretadorProlog where

--------------------------------------------------------------------------------
-- 1. Definição de Tipos de Dados (Requisito 1.1 e 1.3)
--------------------------------------------------------------------------------

-- Átomos representam variáveis proposicionais.
type Atom = String 

-- Cláusulas de Horn: Cabeça e Corpo (lista de átomos).
data Clause = Clause Atom [Atom] 
            deriving (Show, Eq)

-- Um programa é um conjunto finito de cláusulas.
type Program = [Clause]

-- Uma consulta é uma sequência finita de átomos.
type Query = [Atom]

--------------------------------------------------------------------------------
-- 2. Mecanismo de Resolução SLD (Requisito 1.2 e 1.3)
--------------------------------------------------------------------------------

-- Função que enumera todas as provas possíveis (Backtracking Exaustivo).
-- Utiliza a mônada de lista para explorar múltiplos caminhos.
solveAll :: Program -> Query -> [Bool]
solveAll _ [] = [True] -- Sucesso: meta vazia encontrada.
solveAll prog (a:as) = do
    -- Busca corpos de cláusulas cujo cabeçalho coincide com o átomo 'a'.
    body <- [b | Clause head b <- prog, head == a]
    
    -- Substituição e chamada recursiva para a nova meta.
    solveAll prog (body ++ as)

-- Função principal exigida: retorna True se houver pelo menos uma solução.
solve :: Program -> Query -> Bool
solve prog q = case (solveAll prog q) of
    [] -> False
    _  -> True

--------------------------------------------------------------------------------
-- 3. Exemplos de Teste (Requisito 4)
--------------------------------------------------------------------------------

-- Exemplo 1: Sucesso simples por fato
prog1 :: Program
prog1 = [Clause "chovendo" []]

query1 :: Query
query1 = ["chovendo"] 

-- Exemplo 2: Resolução por regra encadeada
prog2 :: Program
prog2 = [ Clause "bom" ["sol"]
        , Clause "sol" []
        ]

query2 :: Query
query2 = ["bom"]

-- Exemplo 3: Falha por ausência de informação
prog3 :: Program
prog3 = [Clause "nublado" []]

query3 :: Query
query3 = ["nevando"]

-- Função para validar no GHCi (Resultado esperado: [True, True, False])
executarTestes :: [Bool]
executarTestes = [ solve prog1 query1
                 , solve prog2 query2
                 , solve prog3 query3
                 ]