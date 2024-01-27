class_name enemy extends character

@onready var area2DRange: Area2D = $Area2DRange
@onready var CollisionShape2DRange: CollisionObject2D = get_node("Area2DRange/CollisionShape2DRange")

enum BEHAVIOR {IDLE, AGGRESSIVE}
signal behaviorSignal(behavior: BEHAVIOR)
var currentBehavior = BEHAVIOR.IDLE
var range:Vector2 = Vector2(2,2)
var detectionRange: float = 2.0
var speed: Vector2 = Vector2(2,2)
var reactionTimeSec = 1


func _init():
	super._init()
	var onBehaviorChange = func (behavior: BEHAVIOR):
		currentBehavior = behavior
	behaviorSignal.connect(onBehaviorChange)

func _ready():
	var onContact: Callable  = func (body):
		if body.name == "player":
			self.behaviorSignal.emit(BEHAVIOR.AGGRESSIVE)
	self.area2DRange.body_entered.connect(onContact)
	
	var shape: RectangleShape2D =  RectangleShape2D.new()
	shape.size = self.range
	self.CollisionShape2DRange.shape = shape

func behavior():
	await get_tree().create_timer(reactionTimeSec).timeout
