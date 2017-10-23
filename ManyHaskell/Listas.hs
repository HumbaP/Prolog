--Listas en haskell por comprension

--Main> [x^2 | x <- [1..5]]


--Va por orden, depende de lo que pongas es el resultado de salida.
--Main> [(x,y) | x <- [1,2,3], y <- [4,5]]
--Main> [(x,y) | y <- [4,5], x <- [1,2,3]]

--Main> [(x,y) | x <- [1..3], y <- [x..3]]
--Fichas domino.
--Main> [(x,y) | x <- [0..6], y <- [x..6]]

--Concatenar s = lista, ss = list de listas (Solo para identificar lo que es).
--concate :: [[a]] -> [a]
--concate xss = [x | xs <- xss, x <- xss]

--guard, even es un metodo que te dice si es par, restringe valores.
--[x | x <- [1..10], even x]

--tupla de 3 elementos con todas las posibles combinaciones del 1 al 10
--Teorema de pitagoras c^2 = a^2 + b^2
--[(a,b,c) | a <- [1..10], b <- [1..10], c <- [1..10],c^2 == a^2+b^2]

--Guard factors,
factores:: Int -> [Int]
factores n = [x | x <- [1..n], n `mod` x == 0]

--numeros primos
prime :: Int -> Bool
prime n = factores n == [1,n]

primos :: Int -> [Int]
primos n = [x | x <- [1..n], prime x]