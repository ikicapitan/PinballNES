extends Position2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var cartas = [true,true,true,true,true]

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass




func _on_Carta1_body_entered( body ):
	get_node("Carta1/Sprite").frame = 5
	cartas[0] = false
	agregar_puntos()
	


func _on_Carta2_body_entered( body ):
	get_node("Carta2/Sprite").frame = 4
	cartas[1] = false
	agregar_puntos()
	


func _on_Carta3_body_entered( body ):
	get_node("Carta3/Sprite").frame = 3
	cartas[2] = false
	agregar_puntos()
	


func _on_Carta4_body_entered( body ):
	get_node("Carta4/Sprite").frame = 2
	cartas[3] = false
	agregar_puntos()
	


func _on_Carta5_body_entered( body ):
	get_node("Carta5/Sprite").frame = 1
	cartas[4] = false
	agregar_puntos()
	
	
func agregar_puntos():
	get_tree().get_nodes_in_group("sfx")[0].get_node("2").play()
	gamehandler.actualizar_puntaje(15)
	chequear_combo()
	
func chequear_combo():
	var cartas_falsas = 0
	for carta in cartas:
		if(!carta):
			cartas_falsas += 1
	print(cartas_falsas)
	if(cartas_falsas == 5):
		gamehandler.actualizar_puntaje(500)
		for carta in cartas:
			carta = true
		for i in 5:
			var nodo = "Carta"+String(i+1)+"/Sprite"
			get_node(nodo).frame = 0
		
	
