extends KinematicBody2D

export (int) var direccion #0 izq, 1 der
export (int) var mov
export (int) var vel

func _ready():
	if(direccion == 0): #Si va a la izq
		mov = -mov #Se mueve en X negativamente
		rotation_degrees = 180
	#Sino matiene el valor porque a la derecha ya es positivo

func _physics_process(delta):
	move_and_collide(Vector2(mov,0) * vel * delta)
	print("soy un auto")