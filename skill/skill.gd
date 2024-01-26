class_name skill extends entity

func _ready():
	self.collisionObject2D.body_entered.connect(onContact)

func _physics_process(delta):
	behavior()

func behavior():
	pass

func onContact(body: Node2D):
	pass
