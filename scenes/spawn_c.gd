extends Position2D


var auto
var posicion

func _ready():
	randomize() #Semilla para el azar
	auto = randi()%5 #Azar auto entre 0 a 4 para elegir el modelo a spawnear
	posicion = randi()%10 #Azar para ver si aparece en izq o derecha
	set_timer()
	get_node("Timer").start()
	generar_auto()

func set_timer():
	match(auto):
		0:
			get_node("Timer").wait_time = 2
		1:
			get_node("Timer").wait_time = 2
		2:
			get_node("Timer").wait_time = 2
		3:
			get_node("Timer").wait_time = 2
		4:
			get_node("Timer").wait_time = 8

func generar_auto():

	match (auto): #Evalua que valor le toco a auto
		0:
			var newauto1 = get_tree().get_nodes_in_group("main")[0].auto1.instance() #Creamos el auto
			get_tree().get_nodes_in_group("nivel")[0].call_deferred("add_child", newauto1) #Lo agregamos como hijo al nivel
			if(posicion < 5): #Si debe spawnear izq
				newauto1.global_position = global_position
				newauto1.direccion = 1
				newauto1.spawn_original = self
			else:
				newauto1.global_position = get_node("spawn_ci").global_position
				newauto1.spawn_original = get_node("spawn_ci")
			
		1: 
			var newauto2 = get_tree().get_nodes_in_group("main")[0].auto2.instance() #Creamos el auto
			get_tree().get_nodes_in_group("nivel")[0].call_deferred("add_child",newauto2) #Lo agregamos como hijo al nivel
			if(posicion < 5): #Si debe spawnear izq
				newauto2.direccion = 1
				newauto2.global_position = global_position
				newauto2.spawn_original = self
			else:
				newauto2.global_position = get_node("spawn_ci").global_position
				newauto2.spawn_original = get_node("spawn_ci")
		2:
			var newauto3 = get_tree().get_nodes_in_group("main")[0].auto3.instance() #Creamos el auto
			get_tree().get_nodes_in_group("nivel")[0].call_deferred("add_child",newauto3) #Lo agregamos como hijo al nivel
			if(posicion < 5): #Si debe spawnear izq
				newauto3.direccion = 1
				newauto3.global_position = global_position
				newauto3.spawn_original = self
			else:
				newauto3.global_position = get_node("spawn_ci").global_position
				newauto3.spawn_original = get_node("spawn_ci")
		3:
			var newauto4 = get_tree().get_nodes_in_group("main")[0].auto4.instance() #Creamos el auto
			get_tree().get_nodes_in_group("nivel")[0].call_deferred("add_child",newauto4) #Lo agregamos como hijo al nivel
			if(posicion < 5): #Si debe spawnear izq
				newauto4.direccion = 1
				newauto4.global_position = global_position
				newauto4.spawn_original = self
			else:
				newauto4.global_position = get_node("spawn_ci").global_position
				newauto4.spawn_original = get_node("spawn_ci")
		4:
			var newauto5 = get_tree().get_nodes_in_group("main")[0].auto5.instance() #Creamos el auto
			get_tree().get_nodes_in_group("nivel")[0].call_deferred("add_child",newauto5) #Lo agregamos como hijo al nivel
			if(posicion < 5): #Si debe spawnear izq
				newauto5.direccion = 1
				newauto5.global_position = global_position
				newauto5.spawn_original = self
			else:
				newauto5.global_position = get_node("spawn_ci").global_position
				newauto5.spawn_original = get_node("spawn_ci")


func _on_Timer_timeout():
	generar_auto()
