class_name player extends character
@onready var melee:Node2D  = $melee
@onready var skill:Melee  = melee.get_child(0)
var speed: int = 650
var accel = 7.0
var input = Vector2.ZERO

func _init():
	super._init()
	size = Vector2(15,30)

func _physics_process(delta):
	if Input.is_action_pressed("attack"):
		skill.toggleVisibilitySignal.emit()
		await skill
		self.animations_attacks[self.currentDirection].call()
		await get_tree().create_timer(.5).timeout
		skill.toggleVisibilitySignal.emit()
		await skill
	var playerInput = get_input()

#	velocity = lerp(velocity, playerInput * speed, delta * accel)
	velocity = playerInput * speed * delta * accel

	if currentState == STATE.DEAD:
		return
	
	if playerInput == Vector2.ZERO && !Input.is_action_pressed("attack"):
		self.animatedSprite2D.play("idle")
	else:
		if playerInput.y > 0:
			self.animatedSprite2D.play("move_down")
		elif playerInput.y < 0:
			self.animatedSprite2D.play("move_up")
		elif playerInput.x > 0:
			self.animatedSprite2D.play("move_side")
			self.animatedSprite2D.flip_h = true
		elif playerInput.x < 0:
			self.animatedSprite2D.play("move_side")
			self.animatedSprite2D.flip_h = false
	
	var collision = move_and_collide(velocity * delta)
	if collision != null:
		if collision.get_collider().name == "entity":
			get_tree().change_scene_to_file("res://video/game_over.tscn")
			
		
	

func get_input():
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return input.normalized()

func _on_area_2d_2_area_entered(area):
	print("entro")

func _on_area_2d_2_body_entered(body):
	print("entro 2")
