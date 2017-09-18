import presentacion.*
import cancion.*
import guitarra.*
import musico.*
import album.*


class Musico 
{
	const albumes = []
	var tipoDeMusico
	
	constructor(){}
	
	constructor (unTipoDeMusico)
	{
		self.tipoDeMusico(unTipoDeMusico)
	}
	
	method habilidad() = tipoDeMusico.habilidad()
	method interpretaBien(cancion) = tipoDeMusico.interpretaBien(cancion)
	method cobra(presentacion) = tipoDeMusico.cobra(presentacion,self)
	
	method tipoDeMusico() = tipoDeMusico
	method tipoDeMusico(unTipoDeMusico) 
	{
		tipoDeMusico = unTipoDeMusico
	}
	method agrupate(grupoNuevo)
	{
		tipoDeMusico.grupo(true)
	}
	method dejaGrupo()
	{
		tipoDeMusico.grupo(false)
	}
	
	method esSolista() = tipoDeMusico.grupo().negate()
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
	method sosMinimalista() = self.canciones().all({cancion => cancion.sosCorta()})
	method queCancionesTuyasContienen(palabraBuscada) = self.canciones().filter({cancion => cancion.contenes(palabraBuscada)}).asSet()
	method cuantoDuraTuObra() = self.canciones().sum({cancion => cancion.duracion()})
	method laPego() = self.albumes().all({album => album.tuvisteBuenasVentas()})
}

class MusicoDeGrupo
{
	var grupo	
	var numeroMagico
	var cheque
	var habilidad
	const nombre
	var unicoArtista 
	
	constructor (){}
	
	constructor (unNombre, unaHabilidad, unNumeroMagico)
	{
		nombre = unNombre
		self.habilidad(unaHabilidad)
		self.numeroMagico(unNumeroMagico)
	}
	method nombre() = nombre
	method grupo() = grupo
	method grupo(grupete)
	{
		grupo = grupete
	}
	method unicoArtista() = unicoArtista
	method unicoArtista(bool)
	{
		unicoArtista = bool
	}
	method numeroMagico() = numeroMagico
	method numeroMagico(nuevoNumero) 
	{
		numeroMagico = nuevoNumero
	}
	method cheque() = cheque
	method cheque(unaPlata)
	{
		cheque = unaPlata
	}
	//method habilidad() = if(self.esSolista()) habilidad else (habilidad + numeroMagico)
	method habilidad() = if(self.grupo().negate()) habilidad else (habilidad + numeroMagico)
	method habilidad(unaHabilidad)
	{
		habilidad = unaHabilidad
	}
	method interpretaBien(cancion) = (cancion.duracion() > 300)
	method cobra(presentacion,quien) = if (presentacion.sosUnicoArtista(quien)) 100 else 50
}

class MusicoPopular
{
	var palabraMagica
	var cheque
	var habilidad
	var grupo
	const nombre
	
	constructor (){}
	
	constructor (unNombre, unaHabilidad, unaPalabraMagica)
	{
		nombre = unNombre
		self.habilidad(unaHabilidad)
		self.palabraMagica(unaPalabraMagica)
	}
	
	method nombre() = nombre
	method grupo() = grupo
	method grupo(grupete)
	{
		grupo = grupete
	}
	
	method palabraMagica() = palabraMagica
	method palabraMagica(nuevaPalabra) 
	{
		palabraMagica = nuevaPalabra
	}
	method cheque() = cheque
	method cheque(unaPlata)
	{
		cheque = unaPlata
	}
	method habilidad(unaHabilidad)
	{
		habilidad = unaHabilidad
	}
	method habilidad() = if(self.grupo().negate()) habilidad else (habilidad -20)
	method interpretaBien(cancion)
	{
		return cancion.letra().contains(palabraMagica)
	}
	method cobra(presentacion,quien) = if(presentacion.sosLugarConcurrido()) 500 else 400
}


object luisAlberto inherits Musico
{
	var guitarra
	
	method guitarra() = guitarra
	method guitarra(unaGuitarra)
	{
		guitarra = unaGuitarra
	}
	override method habilidad() = (8 * self.guitarra().valor()).min(100)
	override method interpretaBien(cancion) = true
	override method cobra(presentacion) = if (presentacion.fecha() < new Date(1,9,2017)) 1000 else 1200
	
}
