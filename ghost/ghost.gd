extends enemy

var walkInstance: walk = walk.new()

func _init():
	self.attack

func _ready():
	super._ready()
#	var onContact: Callable  = func (body):
#		if body.name == "player":
#
#			body.lifeSignal
#
#	self.area2D.body_entered.connect(onContact)
	
func behavior():
	super.behavior()
	var direction = walkInstance.random(self)
	self.animations[direction].apply()
