class_name enemy extends character

@onready var area2DRange: Area2D = $Area2DRange
@onready var CollisionShape2DRange: CollisionShape2D = get_node("Area2DRange/CollisionShape2DRange")

enum BEHAVIOR {IDLE, AGGRESSIVE}
signal behaviorSignal(behavior: BEHAVIOR)
var currentBehavior = BEHAVIOR.IDLE
var range:Vector2 = Vector2(2,2)
var detectionRange: float = 2.0
var speed: Vector2 = Vector2(2,2)
var reactionTimeSec: float = 1
var walkInstance: walk;
var behaviors: Dictionary = {
	BEHAVIOR.IDLE: func ():
		pass,
	BEHAVIOR.AGGRESSIVE: func ():
		pass
}

func _init():
	super._init()
	walkInstance = walk.new()
	self.add_child(walkInstance)
	var onBehaviorChange = func (behavior: BEHAVIOR):
		currentBehavior = behavior
	behaviorSignal.connect(onBehaviorChange)

func _ready():
#	var newAnimationSpeed = speed.length() / reactionTimeSec  
#	animations = {
#		Vector2.UP: func ():
#			self.animatedSprite2D.play("move_up",newAnimationSpeed),
#		Vector2.RIGHT: func ():
#			self.animatedSprite2D.play("move_right",newAnimationSpeed),
#		Vector2.DOWN: func ():
#			self.animatedSprite2D.play("move_down",newAnimationSpeed),
#		Vector2.LEFT: func ():
#			self.animatedSprite2D.play("move_left",newAnimationSpeed),
#		Vector2.ZERO: func ():
#			self.animatedSprite2D.play("idle",newAnimationSpeed)
#	}
	super._ready()
	var onBodyEntered: Callable  = func (body):
		if body.name == "player":
			self.behaviorSignal.emit(BEHAVIOR.AGGRESSIVE)
	self.area2DRange.body_entered.connect(onBodyEntered)
	
	var onBodyExit: Callable  = func (body):
		if body.name == "player":
			self.behaviorSignal.emit(BEHAVIOR.IDLE)
	self.area2DRange.body_exited.connect(onBodyExit)
	
	var shape: RectangleShape2D =  RectangleShape2D.new()
	shape.size = self.range
	self.CollisionShape2DRange.shape = shape

	var onDirectionChange = func (direction):
		self.animations[direction].call()
	directionSignal.connect(onDirectionChange)
	movement()

func movement():
	behaviors[self.currentBehavior].call()
	await get_tree().create_timer(reactionTimeSec).timeout
	movement()
