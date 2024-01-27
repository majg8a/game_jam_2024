extends Control

@onready var start_button = $VBoxContainer/start_button
@onready var options_button = $VBoxContainer/options_button
@onready var quit_button = $VBoxContainer/quit_button
@onready var margin_container = $options_menu/MarginContainer
@onready var vbox_container = $VBoxContainer as VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/start_button.grab_focus()
	handle_connecting_signals()
	
func on_start_button_pressed():
	get_tree().change_scene() #ingresar aca direccion del primer nivel o intro video

func on_options_button_pressed():
	vbox_container.visible = false
	margin_container.set_process(true)
	margin_container.visible = true

func on_quit_button_pressed():
	get_tree().quit
	
func _on_exit_button_pressed():
	vbox_container.visible = true
	margin_container.set_process(false)
	margin_container.visible = false
	
func handle_connecting_signals() -> void:
	start_button.button_down.connect(on_start_button_pressed)
	options_button.button_down.connect(on_options_button_pressed)
	quit_button.button_down.connect(on_quit_button_pressed)

