personas = [("Cervantes","Literatura",1547,1616),("Velazquez","Pintura",1599,1660),("Picasso","Pintura",1881,1973),("Beethoven","Musica",1770,1823),
	("Poincare","Ciencia",1854,1912),("Quevedo","Literatura",1580,1654),("Goya","Pintura",1746,1828),("Einstein","Ciencia",1879,1955),
	("Mozart","Musica",1756,1791),("Botticelli","Pintura",1445,1510),("Borromini","Arquitectura",1599,1667),("Bach","Musica",1685,1750)]

type Nombre = String 
type Trabajo = String
type Nace = Int
type Muere = Int
type Persona = (Nombre, Trabajo, Nace, Muere)


--generadores.

--Nombre De todas las personas
--nombre :: [Persona] -> [Nombre]
--nombre lista = [nom | (nom,_,_,_)<- lista]
nombre :: [Nombre]
nombre = [x | (x, _,_,_) <- personas]

--Nombre de los musicos.
musicos :: [Nombre]
--musicos = [x | (x,m,_,_) <- personas, m == "Musica"]
musicos = [x | (x,"Musica",_,_) <- personas]

--Nombres de las personas dependiendo de la profesion
profesion :: Trabajo -> [Nombre]
profesion t= [x | (x,p,_,_) <- personas, p == t]

--Que personas estan vivas en un año en especifico
vivos :: Int -> [Nombre]
vivos año = [x | (x,_,n,m)<- personas, n<=año,m>=año]

