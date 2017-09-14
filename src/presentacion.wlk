
class Presentacion
{
	var fecha = new Date()
	var artistas 
	var capacidad
	
	constructor()
	{
	}
	constructor(unaFecha,unosArtistas,unaCapacidad)
	{
		self.fecha(unaFecha)
		self.artistas(unosArtistas)
		self.capacidad(unaCapacidad)
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
	method capacidad() = capacidad
	method capacidad(unaCapacidad)
	{
		capacidad = unaCapacidad
	}
	method costo() = artistas.sum({artista =>artista.cobra(self)})
	
	method sosUnicoArtista(artista) = self.artistas() == [artista]
	
}

class LaTrastienda inherits Presentacion
{
	method esSabado() = (self.fecha().dayOfWeek() ==6)
	override method capacidad() = if(self.esSabado()) 700 else 400
}