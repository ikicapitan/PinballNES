extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export (PackedScene) var bola
export (PackedScene) var numeritos

func _ready():
	get_tree().get_nodes_in_group("bolasn")[0].text = String(gamehandler.vidas)

func respawn_bola():
	var newbola = bola.instance()
	newbola.global_position = get_tree().get_nodes_in_group("spawn")[0].global_position
	add_child(newbola)
	

func restart():
	get_tree().reload_current_scene()
	
func regenerar_numeritos():
	numeritos.instance()
	add_child(numeritos)
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func _physics_process(delta):
	if(Input.is_action_just_pressed("tecla_f5")):
		gamehandler.guardar_partida(1)
	elif(Input.is_action_just_pressed("tecla_f7")):
		gamehandler.cargar_partida(1)