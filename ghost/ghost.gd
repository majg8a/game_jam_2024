extends enemy

var walkInstance: walk = walk.new()

func _ready():
	super._ready()
	var onDirectionChange = func (direction):
		self.animations[direction].apply()
	directionSignal.connect(onDirectionChange)
	
	
func behavior():
	super.behavior()
	var behaviors: Dictionary = {
		BEHAVIOR.IDLE: func ():
			directionSignal.emit(walkInstance.random(self)),
		BEHAVIOR.AGGRESSIVE: func ():
			pass
	}
	
	behaviors[self.currentBehavior]
	
