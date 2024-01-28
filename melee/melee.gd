class_name Melee extends skill

var damage: int = 1

func _init():
	super._init()

func _process(delta):
	position = (size / 2) * self.currentDirection

func onContact(body):
	body.lifeSignal(damage * -1)
	
