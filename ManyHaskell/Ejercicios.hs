

factores:: Int -> [Int]
factores n = [x | x <- [1..n], n `mod` x == 0]

--fact 1 = 1 ; sum = 6
--fact 2 = 1, 2 ; sum = 6
--fact 3 = 1, 3 ; sum = 6
--fact 4 = 1, 2, 4 ; sum = 6
--fact 5 = 1, 5 ; sum = 6
--fact 6 = 1, 2 ,3 ,(6) ; sum = 6//excluyendo el 6
perfects :: Int -> [Int]
--perfects n = [x | x <- [1..n], sum(init(factores x))==x]
perfects n = [x | x <- [1..n], sum(factores x)-x==x]

--suma los elementos multiplicados de 2 listas 
scalar :: [Int] -> [Int] -> Int
scalar l ls = product(l) + product(ls)

--saca el factorial
fac :: Int -> Int
fac n = product[1..n]
fac 0 = 1
fac n = n * fac(n-1)

--Multiplica los elementos de una lista
producto :: Num a => [a] -> a
producto [] = 1
producto (n:ns) = n * producto ns

--tamaño de una lista
length1 :: [a] -> Int
length1 [] = 0
length1 (_:xs) = 1 + length1 xs

--invertir una lista
reverse1 :: [a] -> [a]
reverse1 [] = []
reverse1 (x:xs) = reverse xs ++ [x]

zipi :: [a] -> [b] -> [(a,b)]
zipi [] _ = []
zipi _ [] = []
zipi (x:xs)(y:ys) = (x,y) : zip xs ys

drope :: Int -> [a] -> [a]
drope 0 xs = xs
drope _ [] = []
drope n (_:xs) = drope (n-1) xs

(++) :: [a] -> [a] -> [a]
[] ++ ys = ys
(x:xs) ++ ys = x:(xs ++ ys)