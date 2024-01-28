class_name entity extends CharacterBody2D
@onready var animatedSprite2D: AnimatedSprite2D = $AnimatedSprite2D
@onready var collisionShape2D: CollisionShape2D = get_node("Area2D/CollisionShape2D")
@onready var area2D: Area2D = $Area2D

var size:Vector2 = Vector2(15,15)

signal directionSignal(direction: Vector2)
var currentDirection = Vector2.ZERO

var animations: Dictionary = {
	Vector2.UP: func ():
		self.animatedSprite2D.play("move_up"),
	Vector2.RIGHT: func ():
		self.animatedSprite2D.play("move_right"),
	Vector2.DOWN: func ():
		self.animatedSprite2D.play("move_down"),
	Vector2.LEFT: func ():
		self.animatedSprite2D.play("move_left"),
	Vector2.ZERO: func ():
		self.animatedSprite2D.play("idle")
}

func _init():
	var onDirectionChange: Callable = func (direction: Vector2):
		currentDirection = direction
	directionSignal.connect(onDirectionChange)

func _ready():
	var shape: RectangleShape2D =  RectangleShape2D.new()
	shape.size = self.size
	self.collisionShape2D.shape = shape

