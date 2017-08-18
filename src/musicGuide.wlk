//Music Guide

//Musicos

object joaquin
{
	var habilidad = 25
	var grupo = "Pimpinela"
	var cheque = 50
	
	method habilidad() = habilidad
	method habilidad(unaHabilidad)
	{
		habilidad = unaHabilidad
	}
	
	method grupo() = grupo
	method grupo(grupete)
	{
		grupo = grupete
	}
	
	method agrupate(grupoNuevo)
	{
		grupo = grupoNuevo
		habilidad = 25
	}
	
	method dejaGrupo()
	{
		grupo = "Solista"
		habilidad = 20
	}
	
	
	
	method interpretaBien(cancion) = (cancion.dura() > 300)
	
	method cobra(presentacion)
	{
		if ( presentacion.artistas().size() == 1 and presentacion.artistas().contains(self))
		{
			cheque = 100
		}
		return cheque
	}
	
	
	
}

object lucia
{
	var habilidad = 50
	var grupo = "Pimpinela"
	
	method grupo() = grupo
	method grupo(grupete)
	{
		grupo = grupete
	}
	
	method agrupate(grupoNuevo)
	{
		grupo = grupoNuevo
		habilidad = 50
	}
	
	method dejaGrupo()
	{
		grupo = "Solista"
		habilidad = 70
	}
	
	method habilidad() = habilidad
	method habilidad(habil)
	{
		habilidad = habil
	}
	
	
	method interpretaBien(cancion) = cancion.letra().contains("familia")
	
	method cobra(presentacion)
	{
		if (presentacion.capacidad() > 5000)
		{
			return 500
		}
		else
		{
			return 400
		}
	}
}

object luisAlberto
{
	
	method habilidad(guitarra)
	{
		
		return (8 * guitarra.valor()).min(100)
	}
	
	method interpretaBien(cancion) = true
	
	method cobra(presentacion)
	{
		return 0 // arreglar
	}
	
	method fechaPresentacion(presentacion)
	{
		return presentacion.fecha()
	}
	
	
}

//Canciones

object cisne
{
	const duracion = 312
	const letra = "Hoy el viento se abrió quedó vacío el aire una vez más y el manantial brotó y nadie está aquí y puedo ver que solo estallan las hojas al brillar"
	method dura() = duracion
	method letra() = letra
}

object laFamilia
{
	const duracion = 264
	const letra = "Quiero brindar por mi gente sencilla, por el amor brindo por la familia"
	method dura() = duracion
	method letra() = letra
}

//Presentaciones

object lunaPark
{
	const fecha = "20/04/2017"
	const artistas = [joaquin,lucia,luisAlberto]
	const capacidad = 9290
	method fecha() = fecha
	method artistas() = artistas
	method participa() = artistas
	method capacidad() = capacidad	
	method costo() = 0 // arreglar
}

object laTrastienda
{
	var fecha = "15/11/2017"
	var artistas = [joaquin,lucia,luisAlberto]
	var capacidad = 400
	var sabado = false
	method artistas() = artistas
	method artistas(unosArtistas)
	{
		artistas = unosArtistas
	}
	method fecha() = fecha
	method fecha(unaFecha)
	{
		fecha = unaFecha
	}
	method participa() = artistas
	method capacidad() = capacidad
	method capacidad(unaCapacidad)
	{
		capacidad = unaCapacidad
	}
	method queCapacidad()
	{
		if (sabado)
		{
			return 700
		}
		else
		{
			return 400
		}
	}
	method esSabado()
	{
		sabado = true
	}
	method costo() = 0 // arreglar
}

// Guitarras

object fender
{
	const valor = 10
	method valor() = valor
}

object gibson
{
	var valor = 15
	method valor() = valor
	method valor(unValor)
	{
		valor = unValor
	}
	
	method estasRota()
	{
		valor = 5
	}
}
