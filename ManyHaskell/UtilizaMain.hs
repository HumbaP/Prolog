import Data.Char
import Control.Monad

main= do
	putStrLn "Hola Mundo"
	main0

main0 = do
	putStrLn "Hola, ¿Como te llamas?"
	fstName<- getLine
	putStrLn "¿y tu apellido?"
	lstName <- getLine
	let upFstName = map toUpper fstName
	let lrLstName = map toLower lstName
	putStrLn("Hola " ++ upFstName ++ " " ++ lrLstName ++ ", es bueno conocerte.")

main1 = do
	c <- getChar
	when (c /= ' ') $ do
		putChar c --Llama funcion guardar lista
		main1

main3 = do
	lista <- sequence [getLine,getLine,getLine]
	print lista

--comas :: String :: Int
--comas s = 10