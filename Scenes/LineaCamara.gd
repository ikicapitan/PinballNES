extends Area2D

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


func _on_LineaCamara_body_entered( body ):
	if(body.is_in_group("bola")):
		if(get_tree().get_nodes_in_group("cam_top")[0].current):
			get_tree().get_nodes_in_group("cam_bot")[0].current = true
		else:
			get_tree().get_nodes_in_group("cam_top")[0].current = true
