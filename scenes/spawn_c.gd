extends Position2D


func _ready():
	var auto = randi()%4 #Azar auto entre 0 a 4 para elegir el modelo a spawnear
	var posicion = randi()%1 #Azar para ver si aparece en izq o derecha
	match (auto): #Evalua que valor le toco a auto
		0:
			var newauto = get_tree().get_nodes_in_group("main")[0].auto1.instance() #Creamos el auto
			if(posicion == 0): #Si debe spawnear izq
				newauto.global_position = global_position
				newauto.direccion = 1
			else:
				newauto.global_position = get_node("spawn_ci").global_position
			get_tree().get_nodes_in_group("nivel")[0].add_child(newauto) #Lo agregamos como hijo al nivel
		1: 
			var newauto = get_tree().get_nodes_in_group("main")[0].auto2.instance() #Creamos el auto
			get_tree().get_nodes_in_group("nivel")[0].add_child(newauto) #Lo agregamos como hijo al nivel
			if(posicion == 0): #Si debe spawnear izq
				newauto.direccion = 1
				newauto.global_position = global_position
			else:
				newauto.global_position = get_node("spawn_ci").global_position
		2:
			var newauto = get_tree().get_nodes_in_group("main")[0].auto3.instance() #Creamos el auto
			get_tree().get_nodes_in_group("nivel")[0].add_child(newauto) #Lo agregamos como hijo al nivel
			if(posicion == 0): #Si debe spawnear izq
				newauto.direccion = 1
				newauto.global_position = global_position
			else:
				newauto.global_position = get_node("spawn_ci").global_position
		3:
			var newauto = get_tree().get_nodes_in_group("main")[0].auto4.instance() #Creamos el auto
			get_tree().get_nodes_in_group("nivel")[0].add_child(newauto) #Lo agregamos como hijo al nivel
			if(posicion == 0): #Si debe spawnear izq
				newauto.direccion = 1
				newauto.global_position = global_position
			else:
				newauto.global_position = get_node("spawn_ci").global_position
		4:
			var newauto = get_tree().get_nodes_in_group("main")[0].auto5.instance() #Creamos el auto
			get_tree().get_nodes_in_group("nivel")[0].add_child(newauto) #Lo agregamos como hijo al nivel
			if(posicion == 0): #Si debe spawnear izq
				newauto.direccion = 1
				newauto.global_position = global_position
			else:
				newauto.global_position = get_node("spawn_ci").global_position


