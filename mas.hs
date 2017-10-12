--Condicionales
signdum :: Int-> Int
signdum n = if n < 0 then -1 else
			if n == 0 then 0 else 1

absoluto::Int-> Int
absoluto n = if n>= 0 then n else -n 

--ABs usando guardas
absoluteh:: Int-> Int
absoluteh n 
 | n>=0 =n
 | otherwise == -n

 --Funcion not
 --not1:: Bool -> Bool
 --not1 False = True
 --not1 True = False

 edad:: Int-> String
 edad 5 = "Hola, buenas dias"
 edad 7 = "Peppa pig no existe"
 edad 8 = "Que deporte te gusta?"
 edad _ = "Que edad tienes"

 
diaSuerte:: Int-> String
diaSuerte 7 = "Tu dia de suerte"
diaSuerte _ = "Not today"

--Recibe 2 numeros y que regrese ordenado el mayor y el menor
mayor:: Int->Int ->(Int,Int)
mayor x y 
 |x>=y =(x,y)
 |otherwise =(y,x)