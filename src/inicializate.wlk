import presentacion.*
import cancion.*
import guitarra.*
import musico.*
import album.*

object objetitoMagico
{

	method cisne() = new Cancion("cisne",312,"Hoy el viento se abrio quedo vacio el aire una vez mas y el manantial broto y nadie esta aqui y puedo ver que solo estallan las hojas al brillar")
	method laFamilia() = new Cancion("laFamilia",264,"Quiero brindar por mi gente sencilla, por el amor brindo por la familia")
	method	eres() = new Cancion("eres",145,"Eres lo mejor que me paso en la vida, no tengo duda, no habra mas nada despues de ti. Eres lo que le dio brillo al dia a dia, y asi sera por siempre, no cambiara, hasta el final de mis dias")
	method	corazonAmericano() = new Cancion("corazonAmericano",154,"Canta corazon, canta mas alto, que tu pena al fin se va marchando, el nuevo milenio ha de encontrarnos, junto corazon, como soniamos.")
	method	almaDeDiamante() = new Cancion("almaDeDiamante",216,"Ven a mi con tu dulce luz alma de diamante. Y aunque el sol se nuble despues sos alma de diamante. Cielo o piel silencio o verdad sos alma de diamante. Por eso ven asi con la humanidad alma de diamante")
	method	crisantemo() = new Cancion("crisantemo",175,"Tocame junto a esta pared, yo quede por aqui... cuando no hubo mas luz... quiero mirar a traves de mi piel... Crisantemo, que se abrio... encuentra el camino hacia el cielo")

	method	especialLaFamilia() = new Album("especialLaFamilia",[self.laFamilia()],new Date(17,06,1992),100.000,89.000)
	method	laSole() = new Album("laSole",[self.eres(),self.corazonAmericano()],new Date(04,02,2005),200.000,130.000)
	method	paraLosArboles() = new Album("paraLosArboles",[self.cisne(),self.almaDeDiamante()],new Date(31,03,2003),50.000,49.000)
	method	justCrisantemo() = new Album("justCrisantemo",[self.crisantemo()],new Date(05,12,2007),28.000,27.500)
		
	method	kike() = new Musico(new MusicoDeGrupo(60,20))
	method	soledad() = new Musico(new MusicoPopular(55,"amor"))
	method	joaquin() = new Musico(new MusicoDeGrupo(20,5))
	method	lucia() = new Musico(new MusicoPopular(70,"familia"))
		
	method	remixLaFamilia() = new Remix(self.laFamilia())
	method	mashupAlmaDeCrisantemo() = new Mashup([self.almaDeDiamante(), self.crisantemo()])
	
	method lunaPark_20_04_2017() = new Presentacion(new Date(20,04,2017),[self.joaquin(),self.lucia(),luisAlberto], lunaPark)
	method laTrastienda_15_11_2017() = new Presentacion(new Date(02,09,2017),[self.joaquin(),self.lucia(),luisAlberto], laTrastienda)
	method pdpalooza() = new PresentacionConRestricciones(new Date(15,12,2017), [], lunaPark)
	
	method inicializate1()
	{
		
		self.cisne()
		self.laFamilia()
		
		self.joaquin()
		self.lucia()
		
		self.lunaPark_20_04_2017()
		self.laTrastienda_15_11_2017()
		
	}

}