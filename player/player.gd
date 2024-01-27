extends character

@onready var camera2D: Camera2D = $Camera2D
var speed: Vector2 = Vector2(5,5)

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
				
