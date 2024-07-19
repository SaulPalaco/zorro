extends Node2D

var ColeccionableEscena = preload("res://Scenes/colleccionable.tscn")

var dificultad = 0


func _ready():
	#Detenemos por qué por defecto se inicializan uniformemente y para que sea aleatorio se vuelve a iniciar  
	$Timer.stop()
	#Tiempo de espera del Timer para que sea aleatorio 
	$Timer.wait_time = randf_range(2,4)
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#conectamois la señal timeout a soawner
func _on_timer_timeout():
	dificultad += .01
	if $Timer.wait_time > .1:
		$Timer.wait_time -= .1
	var coleccionable = ColeccionableEscena.instantiate()
	coleccionable.Speed += dificultad
	#agregamos a coleccionable como hijo de este nodo
	add_child(coleccionable)
