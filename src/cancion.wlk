
class Cancion
{
	const titulo
	const duracion
	const letra

	constructor(){}
	constructor(unTitulo,unaDuracion,unaLetra)
	{
		titulo = unTitulo
		duracion=unaDuracion
		letra=unaLetra
	}
	
	method titulo() = titulo
	method extencionTitulo() = self.titulo().size()
	method duracion() = duracion
	method letra() = letra
	method sosCorta() = self.duracion() < 180
	method extencionLetra() = self.letra().size()
	method contenes(palabraMagica) = self.letra().toLowerCase().contains(palabraMagica)
}

class Remix inherits Cancion
{
	constructor (unaCancion)
	{
		titulo = unaCancion.titulo()
		duracion = unaCancion.duracion()*3
		letra = "Mueve tu cuelpo baby " + unaCancion.letra() + " yeah oh yeah"
	}
}

class Mashup inherits Cancion
{
	constructor(cancion1, cancion2)
	{
		titulo = cancion1.titulo() + " " + cancion2.titulo()
		duracion = cancion1.duracion().max(cancion2.duracion())
		letra = cancion1.letra() + " " + cancion2.letra()
	}
}

object duracion
{
	method compara (unosTemas) = unosTemas.max({cancion => cancion.duracion()})
}

object extencionLetra
{
	method compara (unosTemas) = unosTemas.max({cancion => cancion.extencionLetra()})
}

object extencionTitulo
{
	method compara (unosTemas) = unosTemas.max({cancion => cancion.extencionTitulo()})
}