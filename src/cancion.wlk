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

object eres inherits Cancion(145,"Eres lo mejor que me pas� en la vida, no tengo duda, no habr� m�s nada despu�s de ti. Eres lo que le dio brillo al d�a a d�a, y as� ser� por siempre, no cambiar�, hasta el final de mis d�as")
{	
}

object corazonAmericano inherits Cancion(154,"�Canta coraz�n, canta m�s alto, que tu pena al fin se va marchando, el nuevo milenio ha de encontrarnos, junto coraz�n, como so�amos.")
{	
}

object almaDeDiamante inherits Cancion(216,"Ven a m� con tu dulce luz alma de diamante. Y aunque el sol se nuble despu�s sos alma de diamante. Cielo o piel silencio o verdad sos alma de diamante. Por eso ven as� con la humanidad alma de diamante")
{	
}

object crisantemo inherits Cancion(175,"T�came junto a esta pared, yo quede por aqu�... cuando no hubo m�s luz... quiero mirar a trav�s de mi piel... Crisantemo, que se abri�... encuentra el camino hacia el cielo")
{	
}