extends Area2D
#lo creamos en booleano
var esManzana = false
var spriteDeEnemigo = preload("res://Assets/spike.png")

var Speed := 1.0

func _ready(): #condicionamos si es manzana o no
	#comportamiento si es espina o manzana 
	if randf() > .5:
		esManzana = true 
		
	if !esManzana:
		$Sprite.texture = spriteDeEnemigo

func _on_body_entered(body):
	if body.is_in_group("Player"):
		#agregamos el nodod principal player al grupo
		if esManzana:
			#llamando metodo 
			body.subirScore()
		else:
			body.morirse()
			#para que la manzana desaparesca al momento de de ser consumida
		queue_free()
#hacemmos que los coleccionables se muevan hacia abajo	
func _process(delta):
	position.y += Speed
