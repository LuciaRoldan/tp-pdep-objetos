
object gibson
{	
	var sana = true
	
	method valor() = if(sana) 15 else 5
	method estasRota()
	{
		sana = false
	}
	method arreglate()
	{
		sana = false
	}
}

object fender
{
	method valor() = 10
}
