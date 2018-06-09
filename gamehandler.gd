extends Node

var puntos = 0
var vidas = 3


var datos_partida = {
	puntos = 0,
	vidas = 0,
	posicion_x = 0.0,
	posicion_y = 0.0
	}


func _ready():
	var path = Directory.new()
	if(!path.dir_exists("user://pin_saves")):
		path.open("user://")
		path.make_dir("user://pin_saves")
	
func actualizar_puntaje(var puntos_e):
	puntos += puntos_e
	get_tree().get_nodes_in_group("puntos")[0].text = String(puntos)

func actualizar_bolas(var bola):
	vidas += bola
	get_tree().get_nodes_in_group("bolasn")[0].text = String(vidas)
	if(vidas >= 0):
		get_tree().get_nodes_in_group("main")[0].respawn_bola()
	else:
		vidas = 3
		puntos = 0
		get_tree().get_nodes_in_group("main")[0].restart()
		
	
func guardar_partida(var numero):
	var save = File.new()
	save.open("user://pin_saves/"+ String(numero) + ".sav", File.WRITE)
	
	var datos_guardar = datos_partida
	datos_guardar.puntos = puntos
	datos_guardar.vidas = vidas
	datos_guardar.posicion_x = get_tree().get_nodes_in_group("bola")[0].global_position.x
	datos_guardar.posicion_y = get_tree().get_nodes_in_group("bola")[0].global_position.y
	
	save.store_line(to_json(datos_guardar))
	save.close()
	
	
func cargar_partida(var numero):
	var cargar = File.new()
	if(!cargar.file_exists("user://pin_saves/"+ String(numero) + ".sav")):
		print("No hay partidas guardadas")
		return
	
	cargar.open("user://pin_saves/"+ String(numero) + ".sav", File.READ)
	
	var datos_cargar = datos_partida
	var todos_datos
	
	if(!cargar.eof_reached()):
		var dato_provis = parse_json(cargar.get_line())
		if(dato_provis != null):
			datos_cargar = dato_provis
			
	cargar.close()
			
	puntos = datos_cargar.puntos
	vidas = datos_cargar.vidas
	get_tree().get_nodes_in_group("bola")[0].global_position.x = datos_cargar.posicion_x
	get_tree().get_nodes_in_group("bola")[0].global_position.y = datos_cargar.posicion_y
	
	actualizar_puntaje(0)
	actualizar_bolas(0)
	