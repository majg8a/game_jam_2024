class_name player extends character

@onready var camera2D: Camera2D = $Camera2D
var speed: Vector2 = Vector2(5,5)

func _init():
	super._init()
	animations = {
		Vector2.UP: func ():
			self.animatedSprite2D.play("move_up"),
		Vector2.RIGHT: func ():
			self.animatedSprite2D.play("move_side"),
		Vector2.DOWN: func ():
			self.animatedSprite2D.play("move_down"),
		Vector2.LEFT: func ():
			self.animatedSprite2D.play("move_side"),
		Vector2.ZERO: func ():
			self.animatedSprite2D.play("idle")
	}

var movementAtions: Dictionary = {
	"ui_up": 
		func ():
			animations[Direction.directions[0]].call()
			self.move_and_collide(self.speed * Direction.directions[0]),
	"ui_right": 
		func ():
			animations[Direction.directions[1]].call()
			self.move_and_collide(self.speed * Direction.directions[1]),
	"ui_down":  
		func ():
			animations[Direction.directions[2]].call()
			self.move_and_collide(self.speed * Direction.directions[2]),
	"ui_left": 
		func ():
			animations[Direction.directions[3]].call()
			self.move_and_collide(self.speed * Direction.directions[3]),
}

func behavior():
	if currentState == STATE.ALIVE:
		for key in self.movementAtions.keys():
			if Input.is_action_pressed(key):
				if key == "ui_right":
					self.animatedSprite2D.flip_h = true
				else:
					self.animatedSprite2D.flip_h = false
				self.movementAtions[key].call()
				
