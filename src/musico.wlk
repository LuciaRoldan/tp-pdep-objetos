import presentacion.*
import cancion.*
import guitarra.*
import musico.*
import album.*


class Musico 
{
	const albumes = []
	var tipoDeMusico
	
	constructor (unTipoDeMusico)
	{
		self.tipoDeMusico(unTipoDeMusico)
	}
	
	method habilidad() = tipoDeMusico.habilidad()
	method interpretaBien(cancion) = self.esDeTuAutoria(cancion) || self.sosHabilidoso()|| tipoDeMusico.interpretaBien(cancion)
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
	
	method habilidad(unaHabilidad)
	{
		tipoDeMusico.habilidad(unaHabilidad)
	}
	method esDeTuAutoria(cancion) = self.canciones().contains(cancion)
	method sosHabilidoso() = self.habilidad() > 60 
	
}

class MusicoDeGrupo
{
	var grupo = true
	var numeroMagico
	var habilidad
	
	constructor (unaHabilidad, unNumeroMagico)
	{
		habilidad = unaHabilidad
		numeroMagico = unNumeroMagico
	}
	method grupo() = grupo
	method grupo(grupete)
	{
		grupo = grupete
	}
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
	const palabraMagica
	var habilidad
	var grupo = false
	
	constructor (unaHabilidad, unaPalabraMagica)
	{
		habilidad = unaHabilidad
		palabraMagica = unaPalabraMagica
	}
	
	method grupo() = grupo
	method grupo(grupete)
	{
		grupo = grupete
	}
	method habilidad() = if(self.grupo().negate()) habilidad else (habilidad -20)
	method habilidad(unaHabilidad)
	{
		habilidad = unaHabilidad
	}
	method interpretaBien(cancion) = cancion.letra().contains(palabraMagica)
	method cobra(presentacion,quien) = if(presentacion.sosLugarConcurrido()) 500 else 400
}

class LuisAlberto
{
	var guitarra = fender
	
	method guitarra() = guitarra
	method guitarra(unaGuitarra)
	{
		guitarra = unaGuitarra
	}
	
	method habilidad() = (8 * self.guitarra().valor()).min(100)
	method interpretaBien(cancion) = true
	method cobra(presentacion,quien) = if (presentacion.fecha() < new Date(1,9,2017)) 1000 else 1200
}

object luisAlberto inherits Musico(new LuisAlberto())
{
	method guitarra(unaGuitarra)
	{
		tipoDeMusico.guitarra(unaGuitarra)
	}
}
