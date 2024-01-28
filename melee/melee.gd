class_name Melee extends skill

var damage: int = 1

signal toggleVisibilitySignal()
var toggle: bool = false
func _init():
	super._init()
	self.hide()
	self.size = Vector2(15,15)
	var onToggle = func ():
		toggle = !toggle
		if toggle:
			self.show()
		else:
			self.hide()
	toggleVisibilitySignal.connect(onToggle)
	
func _process(delta):
	position = (size / 2) * self.currentDirection

func onContact(body):
	if toggle:
		body.lifeSignal(damage * -1)
	
