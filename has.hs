
import Data.Char
import Control.Monad
main= putStrLn "Hola Mundo"

{-

-}
main0 = do
   putStrLn "¿Cual es tu nombre?"
   fstName <- getLine
   putStrLn "Y ¿tu apellido?"
   lstName <- getLine
   let upFstName = map toUpper fstName
       upLstName = map toLower lstName
   putStrLn ("Hola "++ upFstName++" "++upLstName++" un gusto conocerte")


main2 = do
   c <- getChar
   when (c /= ' ')  $ do 
      putChar c -- Llamar funcion guardar lista
      main2

main3  = do
   lista <- sequence [getLine, getLine, getLine]
   print lista