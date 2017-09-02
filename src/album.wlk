import musico.*
import presentacion.*
import cancion.*
import guitarra.*
import cancion.*

class Album {
	var titulo
	const temas = []
	var fechaDeLanzamiento = new Date()
	var unidadesQueSalieronALaVenta
	var unidadesVendidas
	
	constructor (unosTemas,unaDia, unMes, unAnio,unidSalidas,unidVendidas)
	{
		self.agregaTema(unosTemas)
		self.fechaDeLanzamiento(unaDia, unMes, unAnio)
		self.unidadesQueSalieronALaVenta(unidSalidas)
		self.unidadesVendidas(unidVendidas)
	}

	method titulo() = titulo
	method titulo(tituloNuevo)
	{
		titulo = tituloNuevo
	}
	method temas() = temas
	method agregaTema(unTema) = self.temas().add(unTema)
	method fechaDeLanzamiento() = fechaDeLanzamiento 
	method fechaDeLanzamiento(unaDia, unMes, unAnio)
	{
		fechaDeLanzamiento.initialize(unaDia, unMes, unAnio)
	}	
	method unidadesQueSalieronALaVenta() = unidadesQueSalieronALaVenta
	method unidadesQueSalieronALaVenta(unidades)
	{
		unidadesQueSalieronALaVenta = unidades
	}
	method unidadesVendidas() = unidadesVendidas
	method unidadesVendidas(unidades)
	{
		unidadesVendidas = unidades
	}

}
	
object especialLaFamilia inherits Album([laFamilia],17,06,1992,100.000,89.000)
{
}

object laSole inherits Album([eres,corazonAmericano],04,02,2005,200.000,130.000)
{
}

object paraLosArboles inherits Album([cisne,almaDeDiamante],31,03,2003,50.000,49.000)
{
}	

object justCrisantemo inherits Album([crisantemo],05,12,2007,28.000,27.500)
{
}