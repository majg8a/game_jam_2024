extends enemy

var walkInstance: walk = walk.new()

func _ready():
	super._ready()

func behavior():
	super.behavior()
	var direction = walkInstance.random(self)
	self.animations[direction].apply()
