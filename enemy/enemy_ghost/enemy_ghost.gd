class_name enemy_ghost extends enemy

@onready var melee:Node2D  = $melee
@onready var skill:Melee  = melee.get_child(0)

func _init():
	super._init()
	self.size = Vector2(15,15)
	self.reactionTimeSec = 3
	self.speed = Vector2(20,20)
	self.directionSignal.connect(func (direction):
		skill.currentDirection = direction
		)

func _ready():
	behaviors = {
	BEHAVIOR.IDLE: func ():
		await self.walkInstance.random(),
	BEHAVIOR.AGGRESSIVE: func ():
		await self.walkInstance.follow()
		skill.setPosition(self.size * self.currentDirection)
		
		skill.toggleVisibilitySignal.emit()
		self.animations_attacks[self.currentDirection].call()
		await get_tree().create_timer(.5).timeout
		skill.toggleVisibilitySignal.emit()
		
		await self.walkInstance.follow()
	}
	super._ready()
