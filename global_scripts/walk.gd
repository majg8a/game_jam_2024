class_name walk extends Node2D

var directions: Direction = Direction.new()

func random():
	directions.directions.push_back(Vector2.ZERO)
	var direction = directions.getRandomDirection()
	var node = get_parent() 
	if node != null:
		node.directionSignal.emit(direction)
		for i in range(node.speed.length()):
			await get_tree().create_timer(node.reactionTimeSec / node.speed.length()).timeout
			node.move_and_collide( i * direction)

func breath_first(node: CharacterBody2D, targetNode: Node2D):
	var distances = Direction.directions.map(func (dir: Vector2):
			return pow(2,targetNode.position.length() - (dir * node.speed).length())
			)
	var minDistance = distances.min()
	var minDistanceIndex = distances.find(minDistance)
	var minDistanceVector = Direction.directions[minDistanceIndex] * node.speed
	var collision = node.move_and_collide(minDistanceVector)
