extends enemy

var walkInstance: walk = walk.new()

func _init():
	super._init()
	self.size = Vector2(15,15)

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
	
