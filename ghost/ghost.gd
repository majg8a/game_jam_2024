extends enemy

var walkInstance: walk = walk.new()

func _init():
	
#	self.collisionObject2D.

func behavior():
	super.behavior()
	walkInstance.random(self)
