extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var objs_omisibles = get_tree().get_nodes_in_group("omisible")
	for obj_omisible in objs_omisibles:
		add_collision_exception_with(obj_omisible)

func _physics_process(delta):
	pass

func _on_VisibilityNotifier2D_screen_exited():
	pass


func _on_Bola_body_entered( body ):
	if(body.is_in_group("tambor")):
		body.get_node("animacion").play("golpe")
		gamehandler.actualizar_puntaje(100)
	elif(body.is_in_group("numero")):
		body.queue_free()
		body.get_parent().chequear_lista()
		gamehandler.actualizar_puntaje(10)
		
func _integrate_forces(state):
	for i in range(state.get_contact_count()):
		if(state.get_contact_collider_object(i).is_in_group("tambor")):
			var normal = state.get_contact_local_normal(i)
			apply_impulse(global_position, normal * 2)
			get_tree().get_nodes_in_group("sfx")[0].get_node("1").play()
		


