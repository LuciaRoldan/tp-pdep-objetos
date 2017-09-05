
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
	method duracion() = duracion
	method letra() = letra
	method sosCorta() = self.duracion() < 180
	method extencion() 
	{
		return letra.size()
	}
}
