class_name player extends character

@onready var camera2D: Camera2D = $Camera2D
var speed: int = 100
var accel = 1.0
var input = Vector2.ZERO

func _init():
	super._init()
	size = Vector2(15,15)
	
	
#func _ready():
#	super._ready()
#
#	var on_state_change = func (state: STATE): 
#		if state == STATE.DEAD:
#			print("me mori")
#			self.animatedSprite2D.play("death")
#
#	stateSignal.connect(on_state_change)
#	stateSignal.emit(STATE.DEAD)
	
func _physics_process(delta):
	var playerInput = get_input()

	velocity = lerp(velocity, playerInput * speed, delta * accel)

	if currentState == STATE.DEAD:
		return
	
	if playerInput == Vector2.ZERO:
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
	
	move_and_slide()


func get_input():
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return input.normalized()

#func _init():
#	super._init()
#	animations = {
#		Vector2.UP: func ():
#			self.animatedSprite2D.play("move_up"),
#		Vector2.RIGHT: func ():
#			self.animatedSprite2D.play("move_side"),
#		Vector2.DOWN: func ():
#			self.animatedSprite2D.play("move_down"),
#		Vector2.LEFT: func ():
#			self.animatedSprite2D.play("move_side"),
#		Vector2.ZERO: func ():
#			self.animatedSprite2D.play("idle")
#	}
#
#var movementAtions: Dictionary = {
#	"ui_up": 
#		func ():
#			animations[Direction.directions[0]].call()
#			self.move_and_collide(self.speed * Direction.directions[0]),
#	"ui_right": 
#		func ():
#			animations[Direction.directions[1]].call()
#			self.move_and_collide(self.speed * Direction.directions[1]),
#	"ui_down":  
#		func ():
#			animations[Direction.directions[2]].call()
#			self.move_and_collide(self.speed * Direction.directions[2]),
#	"ui_left": 
#		func ():
#			animations[Direction.directions[3]].call()
#			self.move_and_collide(self.speed * Direction.directions[3]),
#}
#
#func _ready():
#	super._ready()
#	var on_animation_finish = func (): self.animatedSprite2D.play("idle")
#	self.animatedSprite2D.animation_finished.connect(on_animation_finish)
#
#func behavior():
#	if currentState == STATE.ALIVE:
#		for key in self.movementAtions.keys():
#			if Input.is_action_pressed(key):
#				if key == "ui_right":
#					self.animatedSprite2D.flip_h = true
#				else:
#					self.animatedSprite2D.flip_h = false
#				self.movementAtions[key].call()


func _on_area_2d_area_entered(area):
	print("area")
#	print("entro en el area")

