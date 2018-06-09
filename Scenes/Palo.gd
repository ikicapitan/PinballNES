extends RigidBody2D


var punto = true #verdadero es a, falso es b
export (float) var velocidad_mov

func _ready():
	pass

func _physics_process(delta):
	if(punto):
		linear_velocity = Vector2(velocidad_mov, 0)
	else:
		linear_velocity = Vector2(-velocidad_mov, 0)

func _on_areaA_body_entered( body ):
	
	if(body.is_in_group("paletita") && !punto):
		punto = true
		
func _on_areaB_body_entered( body ):
	if(body.is_in_group("paletita")):
		punto = false

		
		
