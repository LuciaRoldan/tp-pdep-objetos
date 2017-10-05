import presentacion.*
import cancion.*
import guitarra.*
import musico.*
import album.*


class Musico 
{
	const albumes = #{}
	var tipoDeMusico
	var categoriaDeMusico
	var tipoDeCobro
	
	constructor (unTipoDeMusico, unaCategoriaDeMusico, unTipoDeCobro)
	{
		self.tipoDeMusico(unTipoDeMusico)
		self.categoriaDeMusico(unaCategoriaDeMusico)
		self.tipoDeCobro(unTipoDeCobro)
	}
	
	method habilidad() = tipoDeMusico.habilidad()
	method interpretaBien(cancion) = self.esDeTuAutoria(cancion) || self.sosHabilidoso()|| categoriaDeMusico.interpretaBien(cancion)
	method cobra(presentacion) = tipoDeCobro.cobra(presentacion,self)
	
	method tipoDeMusico() = tipoDeMusico
	method tipoDeMusico(unTipoDeMusico) 
	{
		tipoDeMusico = unTipoDeMusico
	}
	method categoriaDeMusico() = categoriaDeMusico
	method categoriaDeMusico(unaCategoriaDeMusico) 
	{
		categoriaDeMusico = unaCategoriaDeMusico
	}
	method tipoDeCobro() = tipoDeCobro
	method tipoDeCobro(unTipoDeCobro) 
	{
		tipoDeCobro = unTipoDeCobro
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
		const canciones = #{}
		self.albumes().forEach({album => canciones.addAll(album.temas())})
		return canciones  
	}
	method sosMinimalista() = self.canciones().all({cancion => cancion.sosCorta()})
	method queCancionesTuyasContienen(palabraBuscada) = self.canciones().filter({cancion => cancion.contenes(palabraBuscada)})
	method cuantoDuraTuObra() = self.canciones().sum({cancion => cancion.duracion()})
	method laPegaste() = self.albumes().all({album => album.tuvisteBuenasVentas()})
	
	method habilidad(unaHabilidad)
	{
		tipoDeMusico.habilidad(unaHabilidad)
	}
	method esDeTuAutoria(cancion) = self.canciones().contains(cancion)
	method sosHabilidoso() = self.habilidad() > 60 
	method cualSabesInterpretar(listaDeCanciones) = listaDeCanciones.sortBy({ cancion => categoriaDeMusico.interpretaBien(cancion)})
	
}

class Palabrero
{
	const palabraMagica
	
	constructor (unaPalabraMagica)
	{
		palabraMagica = unaPalabraMagica
	}	
	
	method interpretaBien(cancion) = cancion.letra().contains(palabraMagica)
}

class Larguero
{
	
	const numeroMagico
	
	constructor (unNumeroMagico)
	{
		numeroMagico = unNumeroMagico
	}
	
	method numeroMagico() = numeroMagico
	
	method interpretaBien(cancion) = (cancion.duracion() > self.numeroMagico())
	
}

class Imparero
{
		
	method interpretaBien(cancion) = (cancion.duracion().mod(2) != 0 )
	
}

class CobraPorMusico
{
	const cobro
	
	constructor (unaPlata)
	{
		cobro = unaPlata
	}
	
	method cobra(presentacion,quien) = if (presentacion.sosUnicoArtista(quien)) cobro else cobro/2
}

class CobraPorCapacidad
{
	const capacidad
	const cobro
	
	constructor (unosPesos, unasPersonas)
	{
		capacidad = unasPersonas
		cobro = unosPesos
	}
	
	method cobra(presentacion,quien) = if(presentacion.sosLugarConcurrido(capacidad)) cobro else cobro-100
}

class CobraPorFecha
{
	const fecha
	const cobro
	const adicional
	
	constructor (unaFecha, unosPesos, unPorcentaje)
	{
		fecha = unaFecha
		cobro = unosPesos
		adicional = 1 + unPorcentaje/100
	}
	
	method cobra(presentacion,quien) = if (presentacion.fecha() < unaFecha) cobro else (cobro*adicional)
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
}



class MusicoPopular
{
	
	var habilidad
	var grupo = false
	
	constructor (unaHabilidad)
	{
		habilidad = unaHabilidad
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
}


object luisAlberto inherits Musico(null, null, new CobraPorFecha(new Date(01,09,2017), 1000, 20))
{
	var guitarra = fender
	
	method guitarra() = guitarra
	method guitarra(unaGuitarra)
	{
		guitarra = unaGuitarra
	}
	
	override method habilidad() = (8 * self.guitarra().valor()).min(100)
	override method interpretaBien(cancion) = true
}
