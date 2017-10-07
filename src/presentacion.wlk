import cancion.*
import restricciones.*

class Presentacion
{
	var fecha 
	const artistas = #{}
	var lugar 
	
	constructor(unaFecha,unosArtistas,unLugar)
	{
		self.fecha(unaFecha)
		self.agregaArtistas(unosArtistas)
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
	method agregaArtistas(unosArtistas)
	{
		self.artistas().clear()
		self.artistas().addAll(unosArtistas)
	}
	method agregaArtista(unArtista)
	{
		self.artistas().add(unArtista)
	}
	method capacidad() = lugar.capacidad(self.fecha())
	method costo() = artistas.sum({artista =>artista.cobra(self)})
	method sosLugarConcurrido(unaCapacidad) = self.capacidad() > unaCapacidad
	method sosUnicoArtista(artista) = self.artistas() == #{artista}
	method vaATocar(artista) = self.artistas().contains(artista)
	method magia() = self.artistas().sum({artista => artista.habilidad()})
}

object lunaPark 
{
	method capacidad(fecha) = 9290
}

object laTrastienda
{
	method esSabado(fecha) = (fecha.dayOfWeek() == 6)
	method capacidad(fecha) = if(self.esSabado(fecha)) 700 else 400
}

object prixDAmi
{
	method capacidad(fecha) = 150
}

object laCueva
{
	method capacidad(fecha) = 14000
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
	override method agregaArtistas(unosArtistas)
	{
		unosArtistas.forEach({ artista => self.verificaArtista(artista) })
		super(unosArtistas)
	}
	override method agregaArtista(unArtista)
	{
		self.verificaArtista(unArtista)
		super(unArtista)
	}
	
	
}