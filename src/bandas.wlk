
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
	method sumaHabilidades() = self.musicos().sum({musico => musico.habilidad()})
	method habilidad() = self.sumaHabilidades() * (1 + 0.1)
	method cobra(presentacion) = self.musicos().sum({musico => musico.cobra(presentacion)}) + representante.cobra()
	method interpretaBien(cancion) = self.musicos().all({musico => musico.interpretaBien(cancion)})
	method agregaAlbumes(unosAlbumes) = self.albumes().addAll(unosAlbumes)
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
