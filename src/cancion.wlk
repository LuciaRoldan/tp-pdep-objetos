
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
}
