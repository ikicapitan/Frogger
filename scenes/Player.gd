extends KinematicBody2D

export (int) var mov #Cuanto mide cada bloque en el que se movera
var Velocidad = Vector2()
var destino = Vector2()
var movimiento
var en_agua = false
var en_tronco = false
var tronco_v

func _ready():
	pass

func _physics_process(delta):
	
	check_water()
	
	if(!get_node("AnimationPlayer").is_playing()):
		if(Input.is_action_just_pressed("tecla_w")): #Arriba
			Velocidad.y = -mov / get_node("AnimationPlayer").get_animation("jump").length #Velocidad en X tiempo (tiempo de animacion) 
			rotation_degrees = 0 #Rotacion del Sprite segun direccion
			get_node("AnimationPlayer").play("jump")
			destino = global_position
			destino.y -= mov
		elif(Input.is_action_just_pressed("tecla_s")): #Abajo
			Velocidad.y = mov / get_node("AnimationPlayer").get_animation("jump").length
			rotation_degrees = 180
			get_node("AnimationPlayer").play("jump")
			destino = global_position
			destino.y += mov
		elif(Input.is_action_just_pressed("tecla_a")): #Izq
			rotation_degrees = 270
			Velocidad.x = -mov / get_node("AnimationPlayer").get_animation("jump").length
			get_node("AnimationPlayer").play("jump")
			destino = global_position
			destino.x -= mov
		elif(Input.is_action_just_pressed("tecla_d")): #Der
			rotation_degrees = 90
			Velocidad.x = mov / get_node("AnimationPlayer").get_animation("jump").length
			get_node("AnimationPlayer").play("jump")
			destino = global_position
			destino.x += mov
		
	#Moviendo
	
	var obj_colisionado = move_and_collide(Velocidad * delta) #Movimiento
	
	if(obj_colisionado != null && obj_colisionado.collider.is_in_group("enemigo")):
		gameover()
		
func gameover():
	gamehandler.nivel = 1
	get_tree().reload_current_scene() #Restartea la escena al morir


func check_water():
	if(en_agua && !en_tronco && !get_node("AnimationPlayer").is_playing()):
		gameover()
	elif(en_agua && en_tronco && !get_node("AnimationPlayer").is_playing()):
		Velocidad.x = tronco_v

func _on_AnimationPlayer_animation_finished( anim_name ):
	if(anim_name == "jump"): #Si estoy avanzando
		Velocidad.x = 0 #Llegue al casillero proximo asi que reseteo velocidad
		Velocidad.y = 0
		
		if(en_tronco):
			global_position.y = destino.y
		else:
			global_position = destino
		

func _on_VisibilityNotifier2D_screen_exited():
	gameover()
