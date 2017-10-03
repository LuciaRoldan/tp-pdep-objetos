import cancion.*

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
	var condicionHabilidad = 70
	var condicionCanciones = 0
	var cancionPdP = new Cancion("Cancion De Alicia En El Pais",510,"Quien sabe Alicia, este país no estuvo hecho porque sí. Te vas a ir, vas a salir pero te quedas, ¿dónde más vas a ir? Y es que aquí, sabes el trabalenguas, trabalenguas, el asesino te asesina, y es mucho para ti. Se acabo ese juego que te hacía feliz.")
		
	method condicionHabilidad() = condicionHabilidad
	method condicionHabilidad(unaCondicion)
	{
		condicionHabilidad = unaCondicion
	}
	method condicionCanciones() = condicionCanciones
	method condicionCanciones(unaCondicion)
	{
		condicionCanciones = unaCondicion
	}
	method cancionPdP() = cancionPdP
	method cancionPdP(unaCancion)
	{
		cancionPdP = unaCancion
	}
		method verificaArtista(unArtista)
	{
					
		if ( unArtista.habilidad() <= self.condicionHabilidad())
		{
			throw new Exception("La habilidad del artista tiene que ser mayor a 70")
		}
		if ( unArtista.canciones().size() <= self.condicionCanciones())
		{
			throw new Exception("El artista debe haber compuesto al menos una cancion")
		}
		if ( unArtista.interpretaBien(self.cancionPdP()).negate())
		{
			throw new Exception("El artista debe saber ejecutar 'Cancion De Alicia En El Pais'")
		}
	}
	override method agregaArtista(unArtista)
	{
		self.verificaArtista(unArtista)
		super(unArtista)
	}
	
	
}