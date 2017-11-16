data DiaSemana = Lunes | Martes | Miercoles | Jueves | Viernes | Sabado | Domingo
 deriving (Eq, Ord, Enum, Read, Show, Bounded)

diaLaborable :: DiaSemana -> Bool
diaLaborable d = Lunes <= d && d <= Viernes

diaFestivo :: DiaSemana -> Bool
diaFestivo d = d == Sabado || d == Domingo


data Estacion = Primavera | Verano | Otoño | Invierno
 deriving (Eq, Ord, Enum, Read, Show, Bounded)
data Mes = Enero | Febrero | Marzo | Abril | Mayo | Junio | Julio | Agosto | Septiembre | Octubre | Noviembre | Diciembre
 deriving (Eq, Ord, Enum, Read, Show, Bounded)
data Temperatura = Frio | Caliente | Infierno | Templado
 deriving (Eq, Ord, Enum, Read, Show, Bounded)

estacion :: Mes -> Estacion
estacion m 
 | (Marzo <= m && m <= Mayo) = Primavera
 | (Junio <= m && m <= Agosto) = Verano
 | (Septiembre <= m && m <= Noviembre) = Otoño
 | (Diciembre <= m && m <= Febrero) = Invierno
 | otherwise = Primavera

clima :: Estacion -> Temperatura
clima e
 | e == Primavera = Caliente
 | e == Verano = Infierno
 | e == Otoño = Templado
 | e == Invierno = Frio


data Shape = Circle Float | Rect Float Float
 deriving (Eq, Ord, Read, Show)

square :: Float -> Shape
square n = Rect n n

area :: Shape -> Float
area (Circle r) = pi * r^2
area (Rect x y) = x * y

data Maybe2 a = Nothing2 | Just2 a
 deriving (Eq, Ord, Read, Show)

safediv :: Int -> Int -> Maybe2 Int
safediv _ 0 = Nothing2
safediv m n = Just2 ( m `div` n)

safehead :: [a] -> Maybe2 a
safehead [] = Nothing2
safehead xs = Just2 (head xs)