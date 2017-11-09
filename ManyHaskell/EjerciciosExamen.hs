--Generadores por comprension
menores :: Int -> [Int] ->[Int]
menores n ls = [x | x<-ls, x < n]

multiplos :: Int -> Int -> [Int]
multiplos n m = [x | x <-[1..m],x `mod` n == 0]

--dar un numero, y de respuesta una tupla con la lista de los numero pares, y otra lista de numeros impares
paresImpares :: Int -> ([Int],[Int])
paresImpares n = ([x | x <- [1,3..n]],[y | y<-[2,4..n]])




--Patrones y guardas
--1.- recibir la edad de una persona y decirle en que nivel escolar se esprea que este.
nivel :: Int -> String
nivel n
	| n<=3 = "No estudia, demasiado pequeño"
	| n<=6 = "Preescolar"
	| n<=12 = "Primaria"
	| n<=15 = "Secundaria"
	| n<= 18 = "Preparatora"
	| n<= 23 = "Universidad"
	| otherwise = "No estudia"

--2.-IMC.
imc :: (RealFloat a) => a -> a -> String
imc a p
	| p/a^2<16 = "Delgadez Severa"
	| p/a^2<=16.99 =  "Delgadez moderada"
	| p/a^2<= 18.49 = "Delgadez acptable"
	| p/a^2<= 24.99 = "Peso normal"
	| p/a^2<= 29.99 = "Sobrepeso"
	| p/a^2<= 34.99 = "Obeso: Tipo I"
	| p/a^2<= 40 = "Obeso: Tipo II"
	| otherwise = "Obeso: Tipo III"

--Potencia de un numero.
potencia :: Int -> Int ->Int
potencia base exp
	| exp < 0 = 0
	| exp == 0 = 1
	| let = base^exp

--con patron
potencia2 :: Int -> Int -> Int
potencia2 0 0 = 0
potencia2 base 0 = 1
potencia2 base expo = base ^expo

--3 estado civil.
estadoC :: String -> String
estadoC cad 
	| cad == "Soltero" = "Hola Guapo(a)"
	| cad == "Casado" = "Estas fuera de mi alcance"
	| cad == "Concuvinado" = "A medias"
	| otherwise = "Indeterminado"
estadoCivil :: String -> String
estadoCivil "Soltero" = "Hola Guapo(a)"
estadoCivil "Casado" = "Estas fuera de mi alcance"
estadoCivil "Concuvinado" = "A medias"
estadoCivil x = "Indeterminado"