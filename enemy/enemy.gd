class_name enemy extends character

@onready var area2DRange: Area2D = $Area2DRange

enum BEHAVIOR {IDLE, AGGRESSIVE}

var range: float = 1.0
var detectionRange: float = 2.0
var speed: Vector2 = Vector2(2,2)
var reactionTimeSec = 1

func _init(range: Vector2, shape: Vector2):
	super._init(shape)
	

func _ready():
	var onContact: Callable  = func (body):
		if body.name == "player":
			body.lifeSignal
	self.area2D.body_entered.connect(onContact)

func behavior():
	await get_tree().create_timer(reactionTimeSec).timeout
