--Using recursion and the function add, define a function that multiples two natural numbers.
multiplyRecursion:: Int-> Int->Int
multiplyRecursion x 0 = 0
multiplyRecursion x y = x + (multiplyRecursion x (y-1))
--Define a suitable function folde for expressions, and give a few examples of its use.

--A binary tree is complete if the two sub-trees
--of every node are of equal size. Define a function that decides if a binary tree is complete.

--Ejercicio de los niños y la tienda loca
data Desicion = C| D
 deriving (Eq, Ord, Enum, Read, Show)

aPagar:: (Desicion, Desicion)->(Int, Int)
aPagar (C, C) = (1,1)
aPagar (C, D) = (0,5)
aPagar (D, D) = (5,0)
aPagar (D, C) = (3,3)

unirLista :: [Desicion] -> [Desicion] -> [(Desicion,Desicion)]
unirLista as bs = zip as bs

gastoEnDulces:: [(Desicion,Desicion)] -> [(Int,Int)]
gastoEnDulces ds = [ xs |  x<- ds , xs<- [aPagar x]]