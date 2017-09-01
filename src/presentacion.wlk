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

