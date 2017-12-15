import System.IO
import Data.Char
import Control.Monad

promocion:: Int->Int->Int

promocion e p 
 | e<p = e
 | otherwise  =   e-(e `mod` p) +  promocion ((e `div` p)+(e `mod` p)) p 

galletas:: Int->[(Int,Int)]->Bool

galletas n ls = galletasN n ls 0

galletasN ::Int->[(Int,Int)]->Int->Bool
galletasN n [] _ = True
galletasN n ls curr  
  | cur > n = False
  | cur <0 = False
  | otherwise =  galletasN n (tail ls) cur
  where
   cur= curr+ (fst (head ls) - snd (head ls))
   status = True


--Ejercicios
--	Tomar una lista de tamaño N, con sus elementos formar una lista de tuplas con los pares ordenados 
--(Ui, Ui+1), generando N pares, la tupla N, se compondrá del último y el primer elemento de la lista

toTuples:: [Int]->[(Int,Int)]
toTuples xs = zip pres posts ++ [(last xs,head xs)]
 where 
  pres= xs
  posts= tail xs

{-2.	Definir la función    sumas2Cuadrados :: Integer -> [(Integer, Integer)]  tal que (sumas2Cuadrados n) es la lista de los pares
 de números tales que la suma de sus cuadrados es n y el primer elemento del par es mayor o igual que el segundo. Por ejemplo,-}
sumas2Cuadrados :: Integer -> [(Integer, Integer)]
sumas2Cuadrados n = [(x,y)|x<-[0..n],y<-[0..n],(x^2+y^2)==n, x>=y]

{-5.	A Josué le gustan mucho las galletas que hace su mamá, y para que no lo regañe cuando agarra galletas,
 se las come  de  uno de los paquetes hasta dejarle el mayor de sus divisores, pero en caso de que sólo 
 quede una se la come y saca el paquete. Por lo general hace esto hasta que termina con las galletas del
  cartón.Por ejemplo, a partir de un cartón con paquetes que tienen 10, 20 y 30 galletas, se las comería como sigue:-}
maximoDivisor::Int->Int
maximoDivisor 1 = 1
maximoDivisor n = last [x | x <-[1..n-1], (n `mod` x) ==0 ]

{-comeGalletas:: [Int]
comeGalletas [] = do
 let f=[]
 print "[]" 
 return f

comeGalletas galletas = do
  l<- sequence galletas
  where 
   galletasactuales =  1--((head galletas) `div` (maximoDivisor (head galletas)))
-}
buscaDoble:: [Int]->Int->Bool
buscaDoble xs n 
 | n*2 == head xs -> 

estaSuDoble::[Int]->[Int]