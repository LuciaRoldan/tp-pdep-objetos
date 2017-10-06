
class Banda 
{
	var musicos = #{}
	var representante
	const albumes = #{}
	
	constructor(unosMusicos, unRepresentante, unosAlbumes)
	{
		self.musicos(unosMusicos)
		self.representante(unRepresentante)
		self.agregaAlbumes(unosAlbumes)
	}
	
	method musicos() = musicos
	method musicos(unosMusicos)
	{
		musicos = unosMusicos
	}
	method representante() = representante
	method representante(unoRepresentante)
	{
		representante = unoRepresentante
	}
	method albumes() = albumes
	method sumaHabilidades() = self.musicos().sum({musico => musico.habilidad()}) + representante.habilidad()
	method habilidad() = self.sumaHabilidades() * (1 + 0.1)
	method cobra() = self.musicos().sum({musico => musico.cobra()}) + representante.cobra()
	method interpretaBien(cancion) = self.musicos().all({musico => musico.interpretaBien(cancion)})
	method
}

class Representante 
{

	const cobro
	constructor (unosPesos)
	{
		cobro = unosPesos
	}
	method cobra() = cobro

}
