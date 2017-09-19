
import cancion.*

class Presentacion
{
	var fecha = new Date()
	var artistas = []
	var lugar 
	
	constructor()
	{
	}
	constructor(unaFecha,unosArtistas)
	{
		self.fecha(unaFecha)
		self.artistas(unosArtistas)
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
	method capacidad()
	method costo() = artistas.sum({artista =>artista.cobra(self)})
	method sosLugarConcurrido() = self.capacidad() > 5000
	method sosUnicoArtista(artista) = self.artistas() == [artista]
	method agregaArtista(unArtista)
	{
		self.artistas().add(unArtista)
	}
	
}


class PresentacionEnLunaPark inherits Presentacion
{
	const capacidad = 9290
	override method capacidad() = capacidad
}

class PresentacionEnLaTrastienda inherits Presentacion
{
	method esSabado() = (self.fecha().dayOfWeek() == 6)
	override method capacidad() = if(self.esSabado()) 700 else 400
}

object pdepalooza inherits PresentacionEnLunaPark(new Date(15,12,2017),[])
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