
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
	
	/*Y además!! Hagan que se puedan recibir "n" canciones.

Hay un mensaje que entienden las colecciones llamado "join", que recibe un string, y concatena una lista de strings con eso en el medio.
Y hay un mensaje llamado "trim" que le quita espacios al principio y al final.

Seguro les van a ser útiles.*/
	
}

class Mashup inherits Cancion
{
	constructor(cancion1, cancion2) = super
	(
		cancion1.titulo() + " " + cancion2.titulo(),
		cancion1.duracion().max(cancion2.duracion()),
		cancion1.letra() + " " + cancion2.letra()
	)
}

object duracion
{
	method compara (unTema) = unTema.duracion()
}

object extencionLetra
{
	method compara (unTema) = unTema.extencionLetra()
}

object extencionTitulo
{
	method compara (unTema) = unTema.extencionTitulo()
}