extends enemy

var walkInstance: walk = walk.new()
var animations: Dictionary = {
	Vector2.UP: self.animations"up",
	Vector2.RIGHT: "right",
	Vector2.DOWN: "down",
	Vector2.LEFT: "left"
}

func behavior():
	super.behavior()
	var direction = walkInstance.random(self)
	
