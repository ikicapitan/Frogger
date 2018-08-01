extends KinematicBody2D

export (int) var direccion #0 izq, 1 der
export (int) var mov
export (int) var vel
var spawn_original

func _ready():
	if(direccion == 0): #Si va a la izq
		mov += (gamehandler.nivel-1) * mov / 6
		mov = -mov #Se mueve en X negativamente
		rotation_degrees = 180
	#Sino matiene el valor porque a la derecha ya es positivo

func _physics_process(delta):
	move_and_collide(Vector2(mov,0) * vel * delta)

func _on_VisibilityNotifier2D_screen_exited():
	global_position = spawn_original.global_position
	if(spawn_original.is_in_group("spawn_t")):
		spawn_original.get_node("Timer").stop()
	else:
		spawn_original.get_parent().get_node("Timer").stop()


func _on_Area2D_body_entered( body ):
	if(body.is_in_group("player")):
		body.en_tronco = true
		body.tronco_v = mov


func _on_Area2D_body_exited( body ):
	if(body.is_in_group("player")):
		body.en_tronco = false
