//Music Guide

//Musicos

object joaquin
{
	var habilidad = 20
	var grupo = true
	
	method dejarGrupo()
	{
		grupo = false
	}
	
	method habilidad()
	{
		if (grupo)
		
			return habilidad + 5
		
		else
			return habilidad
	}
	
	
	method interpretaBien(cancion)
	{
		
		if (cancion.dura() > 300)
		 	return "si"
		else
			return "no"
		
	}
	
	method cobra()
	{
		
	}
}

object lucia
{
	var habilidad = 70
	var grupo = true
	
	method dejarGrupo()
	{
		grupo = false
	}
	
	method habilidad()
	{
		if (grupo)
		
			return habilidad - 20
		
		else
			return habilidad
	}
	
	
	method interpretaBien()
	{
		
	}
	
	method cobra()
	{
		
	}
}

object luisAlberto
{
	method habilidad()
	{
		
		
		
	}
	
	
	method interpretaBien()
	{
		
	}
	
	method cobra()
	{
		
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
	const participantes = [joaquin,lucia,luisAlberto]
	method fecha() = fecha
	method participa() = participantes
	
}

object laTrastienda
{
	const fecha = "15/11/2017"
	const participantes = [joaquin,lucia,luisAlberto]
	method fecha() = fecha
	method participa() = participantes
}
