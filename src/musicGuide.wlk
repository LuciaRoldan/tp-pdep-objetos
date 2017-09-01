import musico.*
import presentacion.*
import cancion.*
import guitarra.*

//Music Guide

//Musicos

object joaquin inherits Musico
{
	
	override method agrupate(grupoNuevo)
	{
		grupo = grupoNuevo
		habilidad = 25
	}
	
	override method dejaGrupo()
	{
		grupo = "Solista"
		habilidad = 20
	}
	
	override method interpretaBien(cancion) = (cancion.duracion() > 300)
	
	method sosUnicoArtista(presentacion) = presentacion.artistas().size() == 1 and presentacion.artistas().contains(self)
	
	override method cobra(presentacion)

	{
		if ( self.sosUnicoArtista(presentacion))
		{
			cheque = 100
		}
		else
		{
			cheque = 50
		}
		return cheque
	}
	
}

object lucia inherits Musico
{
	
	override method agrupate(grupoNuevo)
	{
		grupo = grupoNuevo
		habilidad = 50
	}
	
	override method dejaGrupo()
	{
		grupo = "Solista"
		habilidad = 70
	}
	
	override method interpretaBien(cancion) = cancion.letra().contains("familia")
	
	method lugarConcurrido(lugar) = lugar.capacidad() > 5000
	
	override method cobra(presentacion)

	{
		if (self.lugarConcurrido(presentacion))
		{
			return 500
		}
		else
		{
			return 400
		}
	}
}


object luisAlberto inherits Musico
{
	
	override method agrupate(grupoNuevo)
	{
	}
	
	override method dejaGrupo()
	{
	}
	
	method habilidad(guitarra)
	{
		
		return (8 * guitarra.valor()).min(100)
	}
	
	override method interpretaBien(cancion) = true
	
	override method cobra(presentacion)
	{
		if (presentacion.antesDeSept())
		{
			return 1000
		}
		else
		{
			return 1200
		}
	}
	
	method fechaPresentacion(presentacion)
	{
		return presentacion.fecha()
	}
	
	
}

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

object laTrastienda inherits Presentacion(02,09,2017,[joaquin,lucia,luisAlberto],400)
{
	const antesDeSept = false
	var sabado = false
	method antesDeSept() = antesDeSept
	method costo() = artistas.sum({artista =>artista.cobra(self)})
	method esSabado() = (self.fecha().dayOfWeek() ==6)
	method queCapacidad() = if(self.esSabado()) 700 else 400
}



