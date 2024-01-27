class_name OptionsMenu
extends Control

@onready var exit_button = $MarginContainer/VBoxContainer/Exit_Button as Button

func _ready():
	exit_button.grab_focus()
#	set_process(false)
	
func on_exit_pressed() -> void: 
	set_process(false)


func _on_button_pressed():
	pass
