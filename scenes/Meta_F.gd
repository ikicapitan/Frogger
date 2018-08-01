extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Meta_F_body_entered( body ):
	if(body.is_in_group("player")):
		gamehandler.nivel += 1
		get_tree().reload_current_scene()
