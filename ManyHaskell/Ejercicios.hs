

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

scalar :: [Int] -> [Int] -> Int
scalar l li = [x | x <- l+li]
