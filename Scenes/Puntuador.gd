extends Position2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Puntuador1_body_entered( body ):
	if(body.is_in_group("bola")):
		gamehandler.actualizar_puntaje(500)


func _on_Puntuador2_body_entered( body ):
	if(body.is_in_group("bola")):
		gamehandler.actualizar_puntaje(1000)


func _on_Puntuador3_body_entered( body ):
	if(body.is_in_group("bola")):
		gamehandler.actualizar_puntaje(500)
	
	
func _on_Puntuador4_body_entered( body ):
	if(body.is_in_group("bola")):
		gamehandler.actualizar_puntaje(500)

func _on_Puntuador5_body_entered( body ):
	if(body.is_in_group("bola")):
		gamehandler.actualizar_puntaje(100)