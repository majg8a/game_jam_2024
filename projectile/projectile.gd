class_name projectile extends skill

var lifeTimeSec:float = 5.0
var speed: Vector2 = Vector2(1,1)

func behavior():
	directionSignal.emit(get_parent().currentDirection)
	self.move_and_collide(get_parent().currentDirection * speed)
	
