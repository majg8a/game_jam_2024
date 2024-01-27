extends skill

var damage: int = 1

func _ready():
	super._ready()
	position = (size / 2) * self.currentDirection

func onContact(body):
	body.lifeSignal(damage * -1)

