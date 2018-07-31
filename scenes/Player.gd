extends KinematicBody2D

export (int) var mov #Cuanto mide cada bloque en el que se movera
var Velocidad = Vector2()
var movimiento


func _ready():
	pass

func _physics_process(delta):
	
	if(!get_node("AnimationPlayer").is_playing()):
		if(Input.is_action_just_pressed("tecla_w")): #Arriba
			Velocidad.y = -mov / get_node("AnimationPlayer").get_animation("jump").length #Velocidad en X tiempo (tiempo de animacion) 
			rotation_degrees = 0 #Rotacion del Sprite segun direccion
			get_node("AnimationPlayer").play("jump")
		elif(Input.is_action_just_pressed("tecla_s")): #Abajo
			Velocidad.y = mov / get_node("AnimationPlayer").get_animation("jump").length
			rotation_degrees = 180
			get_node("AnimationPlayer").play("jump")
		elif(Input.is_action_just_pressed("tecla_a")): #Izq
			rotation_degrees = 270
			Velocidad.x = -mov / get_node("AnimationPlayer").get_animation("jump").length
			get_node("AnimationPlayer").play("jump")
		elif(Input.is_action_just_pressed("tecla_d")): #Der
			rotation_degrees = 90
			Velocidad.x = mov / get_node("AnimationPlayer").get_animation("jump").length
			get_node("AnimationPlayer").play("jump")
		
	#Moviendo
	
	move_and_collide(Velocidad * delta) #Movimiento


func _on_AnimationPlayer_animation_finished( anim_name ):
	if(anim_name == "jump"): #Si estoy avanzando
		Velocidad.x = 0 #Llegue al casillero proximo asi que reseteo velocidad
		Velocidad.y = 0