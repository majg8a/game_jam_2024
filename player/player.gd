class_name player extends character

@onready var camera2D: Camera2D = $Camera2D
var speed: Vector2 = Vector2(5,5)

func _init():
	super._init()
	animations = {
		Vector2.UP: func ():
			self.animatedSprite2D.play("move_up"),
		Vector2.RIGHT: func ():
			self.animatedSprite2D.play("move_right"),
		Vector2.DOWN: func ():
			self.animatedSprite2D.play("move_down"),
		Vector2.LEFT: func ():
			self.animatedSprite2D.play("move_left"),
		Vector2.ZERO: func ():
			self.animatedSprite2D.play("idle")
	}

var movementAtions: Dictionary = {
	"ui_up": 
		func ():
			self.move_and_collide(self.speed * Direction.directions[0]),
	"ui_right": 
		func ():
			self.move_and_collide(self.speed * Direction.directions[1]),
	"ui_down":  
		func ():
			self.move_and_collide(self.speed * Direction.directions[2]),
	"ui_left": 
		func ():
			self.move_and_collide(self.speed * Direction.directions[3]),
}

func _process(delta):
	self.camera2D.position = self.position

func behavior():
	if currentState == STATE.ALIVE:
		for key in self.movementAtions.keys():
			if Input.is_action_pressed(key):
				self.movementAtions[key].call()
				
