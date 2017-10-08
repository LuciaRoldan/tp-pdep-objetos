
class Banda 
{
	var musicos = #{}
	var representante
	const albumes = #{}
	
	constructor(unosMusicos, unRepresentante, unosAlbumes)
	{
		self.agregaMusicos(unosMusicos)
		self.representante(unRepresentante)
		self.agregaAlbumes(unosAlbumes)
	}
	constructor(unosMusicos, unRepresentante)
	{
		self.musicos(unosMusicos)
		self.representante(unRepresentante)
	}
	
	method musicos() = musicos
	method musicos(unosMusicos)
	{
		musicos = unosMusicos
	}
	
	method agregaMusicos(unosMusicos)
	{
		musicos.addAll(unosMusicos)
		musicos.forEach({musico => musico.agrupate(self)})
	}
	
	method representante() = representante
	method representante(unoRepresentante)
	{
		representante = unoRepresentante
	}
	method albumes() = albumes
	method sumaHabilidades() = self.musicos().sum({musico => musico.habilidad()})
	method habilidad() = self.sumaHabilidades() * self.quimica()
	method quimica() = 1 + 0.1
	method integrantes()
	{
		const integrantes = []
		integrantes.addAll(self.musicos())
		integrantes.add(self.representante())
		return integrantes
	}
	method cobra(presentacion) = self.integrantes().sum({integrante => integrante.cobra(presentacion)})
	method interpretaBien(cancion) = self.musicos().all({musico => musico.interpretaBien(cancion)})
	method agregaAlbumes(unosAlbumes) = self.albumes().addAll(unosAlbumes)
}

class Representante 
{

	var cobro
	constructor (unosPesos)
	{
		cobro = unosPesos
	}
	method cobra(presentacion) = cobro

}
