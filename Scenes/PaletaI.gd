extends Position2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _physics_process(delta):
	
	if(Input.is_action_just_pressed("tecla_a")):
		get_tree().get_nodes_in_group("sfx")[0].get_node("3").play()
	elif(Input.is_action_just_pressed("tecla_d")):
		get_tree().get_nodes_in_group("sfx")[0].get_node("3").play()
	
	if(Input.is_action_pressed("tecla_a")):
		get_node("PaletaI").angular_velocity = -5
		
	if(Input.is_action_pressed("tecla_d")):
		get_node("PaletaD").angular_velocity = 5

