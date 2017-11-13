type Pos = (Float, Float)
type Punto = (Double, Double)
type Pair a = (a,a)
type Pos2 = (Int, Int)
type Trans = Pos2 -> Pos2

data Bool = False | True
data Answer = Yes| No | Unknown

origin :: Pos
origin = (0,0)

left :: Pos -> Pos
left (x,y)=(x-1,y)

--distancia :: (Int,Int) -> (Int,Int) -> Int
distancia :: Pos -> Pos -> Float
--distancia (x,y) (z,a) = sqrt((z-x)^2 + (a-y)^2)	
distancia p1 p2 = sqrt((fst(p2)-fst(p1))^2 + (snd(p2)-snd(p1))^2)

puntoMedio :: Punto -> Punto->Punto
puntoMedio (a,b) (c,d) = (e,f)
 where 
 	e = (a+c)/2
 	f = (b+d)/2

mult :: Pair Int ->Int
mult (m,n) = m*n
copy :: a -> Pair a
copy x = (x,x)

answers :: [Answer]
answers = [Yes,No,Unknown]

flip :: Answer -> Answer
flip Yes = No
flip No = Yes
flip Unknown = Unknown