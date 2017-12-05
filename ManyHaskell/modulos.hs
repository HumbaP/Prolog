
--Las funciones entre parentesis son las que quieres que se vean.
module IOmodulo(saludo, saludo2, lee) where

import Data.Char
import Control.Monad

saludo= do
	putStrLn "Hola Mundo"

saludo2 = do
	putStrLn "Hola, ¿Como te llamas?"
	fstName<- getLine
	putStrLn "¿y tu apellido?"
	lstName <- getLine
	let upFstName = map toUpper fstName
	let lrLstName = map toLower lstName
	putStrLn("Hola " ++ upFstName ++ " " ++ lrLstName ++ ", es bueno conocerte.")

lee = do
	a<- getLine
	b<- getLine
	c<- getLine
	print[a,b,c]

lee2 = do
	rs <- sequence [getLine,getLine,getLine]
	print rs

--El forever repite siempre la funcion.
main11 = forever $ do
	putStr "Teclea algo: "
	l<-getLine
	putStrLn $ map toUpper l