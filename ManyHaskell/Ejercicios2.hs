--usando recursividad y la funcion add, define una funcion que multiplique dos numeros naturales.

add1 :: Int -> Int -> Int
add1 _ 0 = 0
add1 0 _ = 0
add1 1 m = m
add1 m 1 = m
add1 m n = m +(add1 m (n-1))

--Definir la funcion puntosGanados la cual recibe la elección de dos niños, que eligen comprar (D) dulces o (C) chocolates,
--devuelve el importe a pagar por cada niño, si los dos eligen dulces, se los dan a $5, si eligen chocolates son $1, si cada
--uno elige algo diferente el precio cambia segun lo que elijan.

data Tipo = D | C
 deriving (Eq, Ord, Enum, Read, Show, Bounded)

puntosGanados :: (Tipo, Tipo) -> (Int, Int)
puntosGanados (D, D) = (3,3)
puntosGanados (D, C) = (0,5)
puntosGanados (C, D) = (5,0)
puntosGanados (C, C) = (1,1)

--2. definir la función unirListas ::[Elecciones] ->[Elecciones] -> [Elige], la cual toma las listas de dulces por los 2 niños
--y devuelve una lista emparejando las mismas.
--ejemplo: unirListas[C,C,D,D] [D,D,C,D] = [(C,D),(C,D),(D,C),(D,D)]
unirListas :: [Tipo] -> [Tipo] -> [(Tipo,Tipo)]
unirListas l1 l2 = zip l1 l2

--3. Definir la funcion gasto gastoEnDulces :: [Elige] -> [gasto], la cual toma una lista de pedidos de dulces emparejadas y
--devuelve una lista con lo que van a pagar los niños en cada uno de sus pedidos.
gastoEnDulces :: [(Tipo,Tipo)] -> [(Int,Int)]
gastoEnDulces ls = [x | xs <-ls,x <- [puntosGanados xs]]

--4. Definir la funcion gastos :: [gasto] -> ([Int],[Int]), la cual toma una lista con lo que van a pagar los niños en sus pedidos
--y devuelve un par de listas, donde cada componente es una lista con los puntuajes correspondientes a cada jugador.

