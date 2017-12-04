import System.IO

main = do
	texto <- openFile "Ejemplo.txt" ReadMode
	contenido <- hGetContents texto
	putStr contenido
	hClose texto

main0 = do
	algo <- getLine
	appendFile "Ejemplo.txt" ("\n"++algo++"\n")


--consola
--main> words "Hi nigga"
--R:    ["Hi","nigga"]
--main> unwords ["Hi","nigga"]
--R:    "Hi nigga"