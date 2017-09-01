
class Cancion
{
	var duracion
	var letra
	constructor()
	{
		
	}
	constructor(unaDuracion,unaLetra)
	{
		self.duracion(unaDuracion)
		self.letra(unaLetra)
	}
	method duracion() = duracion
	method duracion(unaDuracion)
	{
		duracion = unaDuracion
	}
	method letra() = letra
	method letra(unaLetra)
	{
		letra = unaLetra
	}
}

object cisne inherits Cancion(312,"Hoy el viento se abrio quedo vacio el aire una vez mas y el manantial broto y nadie esta aqui y puedo ver que solo estallan las hojas al brillar")
{	
}

object laFamilia inherits Cancion(264,"Quiero brindar por mi gente sencilla, por el amor brindo por la familia")
{	
}
