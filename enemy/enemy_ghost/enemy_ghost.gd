extends enemy

func _init():
	super._init()
	self.size = Vector2(15,15)
	self.reactionTimeSec = 3
	self.speed = Vector2(20,20)

	behaviors = {
		BEHAVIOR.IDLE: func ():
			self.walkInstance.random(),
		BEHAVIOR.AGGRESSIVE: func ():
			self.walkInstance.follow()
			
	}
