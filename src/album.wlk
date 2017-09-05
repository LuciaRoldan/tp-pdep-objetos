
class Album {
	const titulo
	const temas = []
	var fechaDeLanzamiento = new Date()
	var unidadesQueSalieronALaVenta
	var unidadesVendidas
	
	constructor (unTitulo,unosTemas,unaFecha,unidSalidas,unidVendidas)
	{
		titulo = unTitulo
		self.agregarTemas(unosTemas)
		self.fechaDeLanzamiento(unaFecha)
		self.unidadesQueSalieronALaVenta(unidSalidas)
		self.unidadesVendidas(unidVendidas)
	}

	method titulo() = titulo
	method temas() = temas
	method agregarTemas(unosTemas) = self.temas().addAll(unosTemas)
	method fechaDeLanzamiento() = fechaDeLanzamiento 
	method fechaDeLanzamiento(unaFecha)
	{
		fechaDeLanzamiento = unaFecha
	}	
	method unidadesQueSalieronALaVenta() = unidadesQueSalieronALaVenta
	method unidadesQueSalieronALaVenta(unidades)
	{
		unidadesQueSalieronALaVenta = unidades
	}
	method unidadesVendidas() = unidadesVendidas
	method unidadesVendidas(unidades)
	{
		unidadesVendidas = unidades
	}
	method tuCancionMasLarga() = self.temas().max({cancion => cancion.extencion()})
}
	