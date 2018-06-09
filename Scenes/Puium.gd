extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var vel_puium = Vector2()

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Puium1_body_entered( body ):
	entro_puium(body)


func _on_Puium2_body_entered( body ):
	entro_puium(body)
	
func entro_puium(body):
	if(body.is_in_group("bola")):
		body.get_node("animacion").play("puium")
		yield(body.get_node("animacion"), "animation_finished")
		body.get_node("animacion").play("idle")
		body.apply_impulse(global_position, vel_puium)	
