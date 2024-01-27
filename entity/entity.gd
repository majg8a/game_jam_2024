class_name entity extends CharacterBody2D
@onready var animatedSprite2D: AnimatedSprite2D = $AnimatedSprite2D
@onready var collisionObject2D: CollisionObject2D = get_node("Area2D/CollisionShape2D")
@onready var area2D: Area2D = $Area2D

var size:Vector2 = Vector2(1,1)

func _init(size:Vector2):
	self.size = size

func _ready():
	var shape:RectangleShape2D =  RectangleShape2D.new()
	shape.size = self.size
	self.collisionObject2D.shape = shape
