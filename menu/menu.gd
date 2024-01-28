extends Control

@onready var start_button = $VBoxContainer/start_button
@onready var options_button = $VBoxContainer/options_button
@onready var quit_button = $VBoxContainer/quit_button
@onready var margin_container = $options_menu/MarginContainer
@onready var vbox_container = $VBoxContainer
@onready var exit_button = $options_menu/MarginContainer/VBoxContainer2/Exit_Button
@onready var texture_rect = $TextureRect
@onready var intro_sound = $IntroSound


func _ready():
	start_button.grab_focus()
	handle_connecting_signals()
	
func on_start_button_pressed():
	get_tree().change_scene_to_file("res://test.tscn")

func on_options_button_pressed():
	vbox_container.visible = false
	margin_container.set_process(true)
	margin_container.visible = true
	texture_rect.hide()
	exit_button.grab_focus()
	
func on_quit_button_pressed():
	get_tree().quit()
	
func _on_exit_button_pressed():
	vbox_container.visible = true
	margin_container.set_process(false)
	margin_container.visible = false
	texture_rect.show()
	start_button.grab_focus()
	
func handle_connecting_signals() -> void:
	start_button.button_down.connect(on_start_button_pressed)
	options_button.button_down.connect(on_options_button_pressed)
	quit_button.button_down.connect(on_quit_button_pressed)

