class_name skill extends entity

func _ready():
	super._ready()
	self.area2D.body_entered.connect(onBodyEntered)

func _physics_process(delta):
	behavior()

func behavior():
	pass

func onContact(body: Node2D):
	pass

func onBodyEntered(body: Node2D):
	var enemy = body.get_node_or_null("enemy") 
	
	print(get_parent().name)
	
	if enemy != null && get_parent().name == "player":
		onContact(enemy)
		
	if body.name == "player" && get_parent().get_node_or_null("enemy") != null:
		onContact(body)
