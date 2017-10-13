import presentacion.*
import cancion.*
import guitarra.*
import musico.*
import album.*

class MusicoAbstracto
{
	const albumes = #{}
	var tipoDeCobro
	
	constructor (unTipoDeCobro)
	{
		self.tipoDeCobro(unTipoDeCobro)
	}
	
	method cobra(presentacion) = tipoDeCobro.cobra(presentacion,self)
	method tipoDeCobro() = tipoDeCobro
	method tipoDeCobro(unTipoDeCobro) 
	{
		tipoDeCobro = unTipoDeCobro
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
	method esDeTuAutoria(cancion) = self.canciones().contains(cancion)
	method sosHabilidoso()
	method cualSabesInterpretar(canciones)
}

class Musico inherits MusicoAbstracto
{
	var formaDeInterpretarBien
	var tipoDeMusico
	
	constructor (unTipoDeMusico, unaCategoriaDeMusico, unTipoDeCobro) = super (unTipoDeCobro)
	{
		self.tipoDeMusico(unTipoDeMusico)
		self.formaDeInterpretarBien(unaCategoriaDeMusico)
	}
	
	method tipoDeMusico() = tipoDeMusico
	method tipoDeMusico(unTipoDeMusico) 
	{
		tipoDeMusico = unTipoDeMusico
	}
	method formaDeInterpretarBien() = formaDeInterpretarBien
	method formaDeInterpretarBien(unaFormaDeInterpretarBien) 
	{
		formaDeInterpretarBien = unaFormaDeInterpretarBien
	}
	
	
	method agrupate(grupoNuevo)
	{
		self.tipoDeMusico().estasEnGrupo(true)
	}
	method dejaGrupo()
	{
		self.tipoDeMusico().estasEnGrupo(false)
	}
	
	override method sosHabilidoso() = self.habilidad() > 60 
	override method cualSabesInterpretar(canciones) = canciones.filter({ cancion => self.interpretaBien(cancion)})
	
	method habilidad() = tipoDeMusico.habilidad()
	method habilidad(unaHabilidad)
	{
		tipoDeMusico.habilidad(unaHabilidad)
	}
	method interpretaBien(cancion) = self.esDeTuAutoria(cancion) || self.sosHabilidoso()|| formaDeInterpretarBien.interpretaBien(cancion)
	
}

class Palabrero
{
	const palabraMagica
	
	constructor (unaPalabraMagica)
	{
		palabraMagica = unaPalabraMagica
	}	
	
	method interpretaBien(cancion) = cancion.letra().words().contains(palabraMagica)
}

class Larguero
{
	
	const numeroMagico
	
	constructor (unNumeroMagico)
	{
		numeroMagico = unNumeroMagico
	}
	
	method numeroMagico() = numeroMagico
	
	method interpretaBien(cancion) = cancion.duracion() > self.numeroMagico()
	
}

class Imparero
{
		
	method interpretaBien(cancion) = cancion.duracion() % 2 != 0 
	
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
	
	method cobra(presentacion,quien) = if (presentacion.fecha() < fecha) cobro else (cobro*adicional)
}

class MusicoDeGrupo
{
	var estasEnGrupo = true
	var numeroMagico
	var habilidad
	
	constructor (unaHabilidad, unNumeroMagico)
	{
		habilidad = unaHabilidad
		numeroMagico = unNumeroMagico
	}
	method estasEnGrupo() = estasEnGrupo
	method estasEnGrupo(grupete)
	{
		estasEnGrupo = grupete
	}
	method habilidad() = if(self.estasEnGrupo()) (habilidad + numeroMagico) else habilidad
	method habilidad(unaHabilidad)
	{
		habilidad = unaHabilidad
	}
}

class MusicoPopular
{
	
	var habilidad
	var estasEnGrupo = false
	
	constructor (unaHabilidad)
	{
		habilidad = unaHabilidad
	}
	
	method estasEnGrupo() = estasEnGrupo
	method estasEnGrupo(grupete)
	{
		estasEnGrupo = grupete
	}
	method habilidad() = if(self.estasEnGrupo()) (habilidad -20) else habilidad
	method habilidad(unaHabilidad)
	{
		habilidad = unaHabilidad
	}
}


object luisAlberto inherits MusicoAbstracto(new CobraPorFecha(new Date(01,09,2017), 1000, 20))
{
	var guitarra = fender
	
	method guitarra() = guitarra
	method guitarra(unaGuitarra)
	{
		guitarra = unaGuitarra
	}	
	method habilidad() = (8 * self.guitarra().valor()).min(100)
	method interpretaBien(cancion) = true
	
	override method sosHabilidoso() = self.habilidad() > 60 
	override method cualSabesInterpretar(canciones) = canciones.filter({ cancion => self.interpretaBien(cancion)})
}
