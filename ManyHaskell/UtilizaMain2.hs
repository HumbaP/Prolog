import Data.Char
import Control.Monad
import System.Random

--Problema de ingresado un numero entre un rango es el correcto

main = do
	gen <- getStdGen
	adivina gen

--adivina :: StdGen -> IO()
adivina gen = do
	let (rand, newGen) = randomR (1,6) gen :: (Int, StdGen)
	putStrLn "Numero entre 1 y 6: "
	numStr <- getLine
	when (not $ null numStr) $ do
		let n = read numStr
		if rand == n
			then putStrLn "Le atinaste"
			else do 
				putStrLn "Siguele"
				adivina newGen