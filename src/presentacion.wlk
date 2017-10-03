import cancion.*
import restriccioines.*

class Presentacion
{
	var fecha = new Date()
	var artistas = []
	var lugar 
	
	constructor()
	{
	}
	constructor(unaFecha,unosArtistas,unLugar)
	{
		self.fecha(unaFecha)
		self.artistas(unosArtistas)
		self.lugar(unLugar)
	}
	method lugar() = lugar
	method lugar(unLugar)
	{
		lugar = unLugar
	}
	method fecha() = fecha 
	method fecha(unaFecha)
	{
		fecha = unaFecha
	}
	method artistas() = artistas
	method artistas(unosArtistas)
	{
		artistas = unosArtistas
	}
	method capacidad() = lugar.capacidad(self.fecha())
	method costo() = artistas.sum({artista =>artista.cobra(self)})
	method sosLugarConcurrido() = self.capacidad() > 5000
	method sosUnicoArtista(artista) = self.artistas() == [artista]
	method agregaArtista(unArtista)
	{
		self.artistas().add(unArtista)
	}
	
}

object lunaPark 
{
	const capacidad = 9290
	method capacidad(fecha) = capacidad
}

object laTrastienda
{
	method esSabado(fecha) = (fecha.dayOfWeek() == 6)
	method capacidad(fecha) = if(self.esSabado(fecha)) 700 else 400
}

class PresentacionConRestricciones inherits Presentacion
{
	const restricciones
	
	constructor(unaFecha,unosArtistas,unLugar,unasRestricciones) = super(unaFecha,unosArtistas,unLugar)
	{
		restricciones = unasRestricciones
	}
	
	method restricciones() = restricciones
	method verificaArtista(unArtista)
	{
			self.restricciones().forEach({restriccion => restriccion.cumple(unArtista)})
	}
	override method agregaArtista(unArtista)
	{
		self.verificaArtista(unArtista)
		super(unArtista)
	}
	
	
}