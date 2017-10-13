
class Cancion
{
	const titulo
	const duracion
	const letra

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
	constructor (unaCancion) = super
	(
		unaCancion.titulo(),
		unaCancion.duracion()*3,
		"Mueve tu cuelpo baby " + unaCancion.letra() + " yeah oh yeah"
	)	
}

class Mashup inherits Cancion
{
	constructor(canciones) = super
	(
		canciones.map({cancion => cancion.titulo()}).join(" "),
		canciones.max({cancion => cancion.duracion()}).duracion(),
		canciones.map({cancion => cancion.letra()}).join(" ")
	)
}


object extencionDuracion
{
	method compara(unosTemas) = unosTemas.max({cancion => cancion.duracion()})
}

object extencionLetra
{
	method compara(unosTemas) = unosTemas.max({cancion => cancion.extencionLetra()})
}

object extencionTitulo
{
	method compara(unosTemas) = unosTemas.max({cancion => cancion.extencionTitulo()})
}