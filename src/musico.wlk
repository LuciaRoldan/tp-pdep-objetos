import presentacion.*
import cancion.*
import guitarra.*
import musico.*
import album.*


class Musico {

	var habilidad
	var cheque
	var grupo
	const albumes = []
	
	method grupo() = grupo
	method grupo(grupete)
	{
		grupo = grupete
	}
	method habilidad() = habilidad
	method habilidad(unaHabilidad)
	{
		habilidad = unaHabilidad
	}
	method cheque() = cheque
	method cheque(unaPlata)
	{
		cheque = unaPlata
	}	
	method agrupate(grupoNuevo)
	{
		self.grupo(true)
	}
	method dejaGrupo()
	{
		self.grupo(false)
	}
	method interpretaBien(cancion)	
	method cobra(presentacion)
	method esSolista() = self.grupo().negate()
	method albumes() = albumes
	method agregaAlbum(unAlbum)
	{
		self.albumes().add(unAlbum)
	}
	method canciones()
	{
		const canciones = []
		self.albumes().forEach({album => canciones.addAll(album.temas())})
		return canciones  
	}
	method sosMinimalista() = self.canciones().all({song => song.sosCorta()})
	method queCancionesTuyasContienen(palabraBuscada) = self.canciones().filter({song => song.contenes(palabraBuscada)}).asSet()
	method cuantoDuraTuObra() = self.canciones().sum({cancion => cancion.duracion()})
	method laPego() = self.albumes().all({album => album.tuvisteBuenasVentas()})
}

class MusicoDeGrupo inherits Musico
{
	var numeroMagico
	
	constructor (unGrupo, unaHabilidad, unNumeroMagico)
	{
		self.grupo(unGrupo)
		self.habilidad(unaHabilidad)
		self.numeroMagico(unNumeroMagico)
	}
	
	method numeroMagico() = numeroMagico
	method numeroMagico(nuevoNumero) 
	{
		numeroMagico = nuevoNumero
	}
	override method habilidad() = if(self.esSolista()) habilidad else (habilidad + numeroMagico)
	
	override method interpretaBien(cancion) = (cancion.duracion() > 300)
	
	override method cobra(presentacion)
	{
		if ( presentacion.sosUnicoArtista(self))
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

class MusicoPopular inherits Musico
{
	var palabraMagica
	
	constructor(unGrupo, unaHabilidad, unaPalabraMagica)
	{
		self.grupo(unGrupo)
		self.habilidad(unaHabilidad)
		self.palabraMagica(unaPalabraMagica)
	}
	
	override method habilidad() = if(self.esSolista()) habilidad else (habilidad -20)
	method palabraMagica() = palabraMagica
	method palabraMagica(nuevaPalabra) 
	{
		palabraMagica = nuevaPalabra
	}
	override method interpretaBien(cancion)
	{
		return cancion.letra().contains(palabraMagica)
	}
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
	
	method tuGuitarraEs(guitarra)
	{
		
		habilidad = (8 * guitarra.valor()).min(100)
	}
	
	override method interpretaBien(cancion) = true
	
	override method cobra(presentacion) = if (presentacion.fecha() < new Date(1,9,2017)) 1000 else 1200
	
}
