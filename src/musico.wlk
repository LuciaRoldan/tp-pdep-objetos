
class Musico {

	var habilidad = 00
	var cheque
	var grupo = "Pimpinela"
	
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
		self.grupo(grupoNuevo)
	}
	method dejaGrupo()
	{
		self.grupo("Solista")
	}
	method interpretaBien(cancion)	
	method cobra(presentacion)
	method esSolista() = self.grupo() == "Solista"
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
	
	method palabraMagica() = palabraMagica
	method palabraMagica(nuevaPalabra) 
	{
		palabraMagica = nuevaPalabra
	}
	override method interpretaBien(cancion)
	{
		cancion.letra().contains(palabraMagica)
	}
}

object joaquin inherits MusicoDeGrupo("Pimpinela",20,5)
{
	override method interpretaBien(cancion) = (cancion.duracion() > 300)
	method sosUnicoArtista(presentacion) = presentacion.artistas().size() == 1 and presentacion.artistas().contains(self)
	override method cobra(presentacion)
	{
		if ( self.sosUnicoArtista(presentacion))
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

object lucia inherits MusicoPopular("Pimpinela",70,"familia")
{
	
	override method habilidad() = if(self.esSolista()) habilidad else (habilidad -20)
	//override method interpretaBien(cancion) = cancion.letra().contains("familia")
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
	
	method elegiTuGuitarra(guitarra)
	{
		
		habilidad = (8 * guitarra.valor()).min(100)
	}
	
	override method interpretaBien(cancion) = true
	
	override method cobra(presentacion)
	{
		if (presentacion.antesDeSept())
		{
			return 1000
		}
		else
		{
			return 1200
		}
	}
	
	method fechaPresentacion(presentacion)
	{
		return presentacion.fecha()
	}
	
}

