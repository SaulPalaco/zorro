extends CharacterBody2D

var speed = 100
#Emitimos señal
signal scoreUp
signal playerDied
@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta):
	var inputVel = Input.get_axis("ui_left","ui_right")
	var apreteSalto = Input.get_action_strength("ui_accept")
	
	velocity.x = inputVel * speed
	
	#para quer no se acumule el salto
	if apreteSalto != 0 and is_on_floor():
		velocity.y = 0
		velocity.y -= apreteSalto * 200
	
	if !is_on_floor():
		velocity.y += 10
	move_and_slide()
	
	if velocity.x != 0:
		animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("idle")
	
	if inputVel != 0:
		animated_sprite_2d.flip_h = inputVel < 0
#creamosa el motodo para colisionar con la manzana		
func subirScore():
	$SubirSonido.play()
	emit_signal("scoreUp")
	
func morirse():
	$MorirSonido.play()
	animated_sprite_2d.play("hurt")
	emit_signal("playerDied")

func _ready():
	pass
	
func _process(delta):
	pass
	
func _input(event):
	pass
