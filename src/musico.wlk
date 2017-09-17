import presentacion.*
import cancion.*
import guitarra.*
import musico.*
import album.*


class Musico 
{
	var grupo
	const albumes = []
	var tipoDeMusico
	
	constructor(){}
	
	method grupo() = grupo
	method grupo(grupete)
	{
		grupo = grupete
	}
	method tipoDeMusico() = tipoDeMusico
	method tipoDeMusico(unTipoDeMusico) 
	{
		tipoDeMusico = unTipoDeMusico
	}
	method agrupate(grupoNuevo)
	{
		self.grupo(true)
	}
	method dejaGrupo()
	{
		self.grupo(false)
	}
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
	method sosMinimalista() = self.canciones().all({cancion => cancion.sosCorta()})
	method queCancionesTuyasContienen(palabraBuscada) = self.canciones().filter({cancion => cancion.contenes(palabraBuscada)}).asSet()
	method cuantoDuraTuObra() = self.canciones().sum({cancion => cancion.duracion()})
	method laPego() = self.albumes().all({album => album.tuvisteBuenasVentas()})
}

class MusicoDeGrupo
{
	var numeroMagico
	var cheque
	var habilidad
	
	constructor (unCheque, unaHabilidad, unNumeroMagico)
	{
		self. cheque(unCheque)
		self.habilidad(unaHabilidad)
		self.numeroMagico(unNumeroMagico)
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
	method habilidad(unaHabilidad)
	{
		habilidad = unaHabilidad
	}
	method interpretaBien(cancion) = (cancion.duracion() > 300)
	method cobra(presentacion) = if ( presentacion.sosUnicoArtista(self)) self.cheque(100) else self.cheque(50)
}

class MusicoPopular
{
	var palabraMagica
	var cheque
	var habilidad
	
	constructor (unCheque, unaHabilidad, unaPalabraMagica)
	{
		self. cheque(unCheque)
		self.habilidad(unaHabilidad)
		self.numeroMagico(unaPalabraMagica)
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
	method habilidad() = habilidad
	method habilidad(unaHabilidad)
	{
		habilidad = unaHabilidad
	}
	//method habilidad() = if(self.esSolista()) habilidad else (habilidad -20)
	method interpretaBien(cancion)
	{
		return cancion.letra().contains(palabraMagica)
	}
	method cobra(presentacion) = if(presentacion.sosLugarConcurrido()) self.cheque(500) else self.cheque(400)
}


object luisAlberto inherits Musico
{
	var guitarra
	
	method guitarra() = guitarra
	method guitarra(unaGuitarra)
	{
		guitarra = unaGuitarra
	}
	method habilidad() = (8 * self.guitarra().valor()).min(100)
	method interpretaBien(cancion) = true
	method cobra(presentacion) = if (presentacion.fecha() < new Date(1,9,2017)) 1000 else 1200
	
}
