extends Position2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func chequear_lista():
	var numeros = get_tree().get_nodes_in_group("numero")
	if(numeros.size() == 0):
		gamehandler.actualizar_puntaje(750)
		get_tree().get_nodes_in_group("main")[0].regenerar_numeritos()
		queue_free()