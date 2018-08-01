extends Node


func _ready():
	randomize()
	var resultado = randi()%10+1
	var newmeta = get_tree().get_nodes_in_group("main")[0].meta.instance()
	newmeta.global_position = get_node(String(resultado)).global_position
	get_tree().get_nodes_in_group("nivel")[0].call_deferred("add_child", newmeta)
