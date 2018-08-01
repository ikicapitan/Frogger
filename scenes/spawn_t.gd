extends Position2D


var velocidad
var posicion
export (int) var dir

func _ready():
	randomize() #Semilla para el azar
	velocidad = randi()%5 #Azar auto entre 0 a 4 para elegir el modelo a spawnear
	set_timer()
	get_node("Timer").start()
	generar_tronco()

func set_timer():
	match(velocidad):
		0:
			get_node("Timer").wait_time = 5
		1:
			get_node("Timer").wait_time = 6
		2:
			get_node("Timer").wait_time = 7
		3:
			get_node("Timer").wait_time = 8
		4:
			get_node("Timer").wait_time = 9

func generar_tronco():
	var newt1 = get_tree().get_nodes_in_group("main")[0].tronco.instance() #Creamos el auto
	get_tree().get_nodes_in_group("nivel")[0].call_deferred("add_child", newt1) #Lo agregamos como hijo al nivel
	if(dir == 0): #Si debe spawnear izq
		newt1.global_position = global_position
		newt1.direccion = 1
		newt1.spawn_original = self
	else:
		newt1.global_position = get_node("spawn_ti").global_position
		newt1.spawn_original = get_node("spawn_ti")

func _on_Timer_timeout():
	generar_tronco()
