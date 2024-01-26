class_name Direction

const directions: Array = [Vector2.UP,Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT]
var currentDirections = directions.duplicate()

func getRandomDirection():
	if(!len(currentDirections)):
		currentDirections = directions.duplicate()
	currentDirections.shuffle()
	return currentDirections.pop_back()
