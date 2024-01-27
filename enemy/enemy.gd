class_name enemy extends character

enum BEHAVIOR {IDLE, AGGRESSIVE}

var range: float = 1.0
var detectionRange: float = 2.0
var speed: Vector2 = Vector2(2,2)
var reactionTimeSec = 1


func behavior():
	await get_tree().create_timer(reactionTimeSec).timeout
