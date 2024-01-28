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

signal targetSignal(target: player)
var target: player

func _init():
	super._init()
	walkInstance = walk.new()
	self.add_child(walkInstance)
	var onBehaviorChange = func (behavior: BEHAVIOR):
		currentBehavior = behavior
	behaviorSignal.connect(onBehaviorChange)
	
func _ready():
	super._ready()
	var onTargetChange = func (target: player):
		self.target = target
	targetSignal.connect(onTargetChange)
	
	var onBodyEntered: Callable  = func (body):
		if body.name == "player":
			self.behaviorSignal.emit(BEHAVIOR.AGGRESSIVE)
			targetSignal.emit(body)
	self.area2DRange.body_entered.connect(onBodyEntered)
	
	var onBodyExit: Callable  = func (body):
		if body.name == "player":
			self.behaviorSignal.emit(BEHAVIOR.IDLE)
			targetSignal.emit(null)
	self.area2DRange.body_exited.connect(onBodyExit)
	
	var shape: RectangleShape2D =  RectangleShape2D.new()
	shape.size = self.range
	self.CollisionShape2DRange.shape = shape

	var onDirectionChange = func (direction):
		self.animations[direction].call()
	directionSignal.connect(onDirectionChange)
	movement()

func movement():
	if currentState == STATE.ALIVE:
		await behaviors[self.currentBehavior].call()
	await get_tree().create_timer(reactionTimeSec).timeout
	movement()
