extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var dim_original
var solto = false
export var vel_compresion = 1

func _ready():
	dim_original = get_node("Sprite").transform.get_scale().y

func _physics_process(delta):
	if(Input.is_action_pressed("tecla_espacio")):
		apply_impulse(global_position, Vector2(0, 15))
		if(get_node("Sprite").transform.get_scale().y > 0.2):
			get_node("Sprite").scale = (Vector2(get_node("Sprite").transform.get_scale().x, get_node("Sprite").transform.get_scale().y - vel_compresion*delta))
		
	if(Input.is_action_just_released("tecla_espacio")):
		apply_impulse(global_position, Vector2(0, 450))
		solto = true
		
	if(solto):
		get_node("Sprite").scale = (Vector2(get_node("Sprite").transform.get_scale().x, get_node("Sprite").transform.get_scale().y + vel_compresion*delta))
		if(get_node("Sprite").transform.get_scale().y > dim_original):
			solto = false
			get_node("Sprite").scale = (Vector2(get_node("Sprite").transform.get_scale().x, dim_original))
			


func _on_Resorte_body_entered( body ):
	if(body.is_in_group("bola")):
		body.apply_impulse(body.global_position, Vector2(0, -5))

