
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
	//method habilidad(unaHabilidad)
	//{
	//	habilidad = unaHabilidad
	//}
	
	method cheque() = cheque
	method cheque(unaPlata)
	{
		cheque = unaPlata
	}
	
	method agrupate(grupoNuevo)
	
	method dejaGrupo()
	
	method interpretaBien(cancion)
		
	method cobra(presentacion)
	

}

object joaquin inherits Musico
{
	
	override method agrupate(grupoNuevo)
	{
		grupo = grupoNuevo
		habilidad = 25
	}
	
	override method dejaGrupo()
	{
		grupo = "Solista"
		habilidad = 20
	}
	
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

object lucia inherits Musico
{
	
	override method agrupate(grupoNuevo)
	{
		grupo = grupoNuevo
		habilidad = 50
	}
	
	override method dejaGrupo()
	{
		grupo = "Solista"
		habilidad = 70
	}
	
	override method interpretaBien(cancion) = cancion.letra().contains("familia")
	
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
	
	override method agrupate(grupoNuevo)
	{
	}
	
	override method dejaGrupo()
	{
	}
	
	method habilidad(guitarra)
	{
		
		return (8 * guitarra.valor()).min(100)
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

