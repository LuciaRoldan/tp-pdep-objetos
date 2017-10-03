import cancion.*

class RestriccionAliciaEnElPais inherits Exception
{
	constructor() = super("El artista debe inerpretar bien la Cancion De Alicia En El Pais")
	method cumple(artista) = if(artista.interpretaBien(new Cancion("Cancion De Alicia En El Pais",510,"Quien sabe Alicia, este pais no estuvo hecho porque si. Te vas a ir, vas a salir pero te quedas, a donde mas vas a ir? Y es que aqui, sabes el trabalenguas, trabalenguas, el asesino te asesina, y es mucho para ti. Se acabo ese juego que te hace feliz."))) null else throw self
}

class RestriccionTieneUnaCancion inherits Exception
{
	constructor() = super("El artiste debe tener al menos una cancion")
	method cumple(artista) = if(artista.canciones().size() > 0) null else throw self
}

class RestriccionTieneMasDe70DeHabilidad inherits Exception
{
	constructor() = super("El artista debe tener habilidad mayor a 70")
	method cumple(artista) = if(artista.habilidad() > 70) null else throw self
}