import musico.*
import presentacion.*
import cancion.*
import album.*

class Guitarra
{
	var valor
	
	constructor()
	{
	}
	constructor(unValor)
	{
		self.valor(unValor)
	}
	
	method valor() = valor
	method valor(unValor)
	{
		valor = unValor
	}
}

object fender inherits Guitarra(10)
{
}

object gibson inherits Guitarra(15)
{	
	method estasRota()
	{
		valor = 5
	}
}
