//Presentaciones
import musicGuide.*
import musico.*

class Presentacion
{
	var fecha = new Date()
	var artistas
	var capacidad
	
	constructor()
	{
	}
	constructor(unaDia, unMes, unAnio,unosArtistas,unaCapacidad)
	{
		self.fecha(unaDia, unMes, unAnio)
		self.artistas(unosArtistas)
		self.capacidad(unaCapacidad)
	}
	
	method fecha() = fecha 
	method fecha(unaDia, unMes, unAnio)
	{
		fecha.initialize(unaDia, unMes, unAnio)
	}
	method artistas() = artistas
	method artistas(unosArtistas)
	{
		artistas = unosArtistas
	}
	method capacidad() = capacidad
	method capacidad(unaCapacidad)
	{
		capacidad = unaCapacidad
	}
}

object lunaPark inherits Presentacion(20,04,2017,[joaquin,lucia,luisAlberto],9290)
{
	method costo() = artistas.sum({artista =>artista.cobra(self)})
}

object laTrastienda inherits Presentacion(02,09,2017,[joaquin,lucia,luisAlberto],400)
{
	var sabado = false
	
	method antesDeSept() = antesDeSept
	method costo() = artistas.sum({artista =>artista.cobra(self)})
	method esSabado() = (self.fecha().dayOfWeek() ==6)
	method queCapacidad() = if(self.esSabado()) 700 else 400
}
