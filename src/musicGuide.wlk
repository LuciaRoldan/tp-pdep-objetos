import musico.*
import presentacion.*
import cancion.*
import guitarra.*









//Canciones

object cisne inherits Cancion(312,"Hoy el viento se abrió quedó vacío el aire una vez más y el manantial brotó y nadie está aquí y puedo ver que solo estallan las hojas al brillar")
{	
}

object laFamilia inherits Cancion(264,"Quiero brindar por mi gente sencilla, por el amor brindo por la familia")
{	
}

//Guitarras

object fender inherits Guitarra(10)
{
}

object gibson inherits Guitarra(15)
{	
	method estasRota()
	{
		valor = 5
	}
}

//Presentaciones

object lunaPark inherits Presentacion(20,04,2017,[joaquin,lucia,luisAlberto],9290)
{
	method antesDeSept(unaFecha)
	{
		return true
	}
	method costo() = artistas.sum({artista =>artista.cobra(self)})
}

object laTrastienda inherits Presentacion(15,11,2017,[joaquin,lucia,luisAlberto],400)
{
	const antesDeSept = false
	var sabado = false
	
	
	method antesDeSept() = antesDeSept
	
	method queCapacidad()
	{
		if (sabado)
		{
			return 700
		}
		else
		{
			return 400
		}
	}
	method esSabado()
	{
		sabado = true
	}
	method costo() = artistas.sum({artista =>artista.cobra(self)})
}