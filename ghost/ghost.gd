extends enemy

var walkInstance: walk = walk.new()
var animations: Dictionary = {
	Vector2.UP: func ():
		self.animatedSprite2D.play("up"),
	Vector2.RIGHT: func ():
		self.animatedSprite2D.play("right"),
	Vector2.DOWN: func ():
		self.animatedSprite2D.play("down"),
	Vector2.LEFT: func ():
		self.animatedSprite2D.play("left")
}

func behavior():
	super.behavior()
	var direction = walkInstance.random(self)
	
