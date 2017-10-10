data DiaSemana = Lunes | Martes | Miercoles | Jueves | Viernes | Sabado | Domingo

data Estacion = Primavera | Otoño | Verano | Invierno

data Temp = Calor | Frio | Templado

hayProyecto :: DiaSemana -> Bool
hayProyecto Viernes = True
hayProyecto Lunes = True
hayProyecto _ = False

factorial :: Int -> Int
factorial n = product[1..n]

clima :: Estacion -> Temp
clima Verano = Calor
clima Invierno = Frio
clima _ = Templado