extends Node

@onready var player = $Player
var scoreJugador := 0
#preferimos conectamos por codigo
func _ready():
	$JuegoSonido.play()
	player.connect("scoreUp",subirScore)
	#conectamos la seña de la moricion
	player.connect("playerDied",morir)
	
func subirScore():
	scoreJugador+=1 
	$ScoreLabel.text = str(scoreJugador)
	
	

func morir():
	$DeathScreen/HBoxContainer/FinalScore.text = str(scoreJugador)
	$DeathScreen.show()
	get_tree().paused = true
