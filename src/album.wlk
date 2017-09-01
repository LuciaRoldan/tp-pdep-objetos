
class Album {
	var titulo
	const temas = []
	var fechaDeLanzamiento = new Date()
	var unidadesQueSalieronALaVenta
	var unidadesVendidas
	
	method titulo() = titulo
	method titulo(tituloNuevo)
	{
		titulo = tituloNuevo
	}
	method temas() = temas
	method agregaTema(unTema) = self.temas().add(unTema)
	method fechaDeLanzamiento() = fechaDeLanzamiento 
	method fechaDeLanzamiento(unaDia, unMes, unAnio)
	{
		fechaDeLanzamiento.initialize(unaDia, unMes, unAnio)
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



}