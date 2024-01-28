extends Node2D

func _ready():
	pass 

func _process(delta):
	pass

func _on_enter_body_entered(body):
	print("entro algo en el area")
	get_tree().change_scene_to_file("res://test.tscn")
