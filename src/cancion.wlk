import musico.*
import presentacion.*
import guitarra.*
import album.*

class Cancion
{
	var duracion
	var letra
	constructor()
	{
		
	}
	constructor(unaDuracion,unaLetra)
	{
		self.duracion(unaDuracion)
		self.letra(unaLetra)
	}
	method duracion() = duracion
	method duracion(unaDuracion)
	{
		duracion = unaDuracion
	}
	method letra() = letra
	method letra(unaLetra)
	{
		letra = unaLetra
	}
	method sosCorta() = self.duracion() < 180
}

object cisne inherits Cancion(312,"Hoy el viento se abrio quedo vacio el aire una vez mas y el manantial broto y nadie esta aqui y puedo ver que solo estallan las hojas al brillar")
{	
}

object laFamilia inherits Cancion(264,"Quiero brindar por mi gente sencilla, por el amor brindo por la familia")
{	
}

object eres inherits Cancion(145,"Eres lo mejor que me pasó en la vida, no tengo duda, no habrá más nada después de ti. Eres lo que le dio brillo al día a día, y así será por siempre, no cambiará, hasta el final de mis días")
{	
}

object corazonAmericano inherits Cancion(154,"“Canta corazón, canta más alto, que tu pena al fin se va marchando, el nuevo milenio ha de encontrarnos, junto corazón, como soñamos.")
{	
}

object almaDeDiamante inherits Cancion(216,"Ven a mí con tu dulce luz alma de diamante. Y aunque el sol se nuble después sos alma de diamante. Cielo o piel silencio o verdad sos alma de diamante. Por eso ven así con la humanidad alma de diamante")
{	
}

object crisantemo inherits Cancion(175,"Tócame junto a esta pared, yo quede por aquí... cuando no hubo más luz... quiero mirar a través de mi piel... Crisantemo, que se abrió... encuentra el camino hacia el cielo")
{	
}