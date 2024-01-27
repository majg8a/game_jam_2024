class_name walk

func random(node: CharacterBody2D = null):
	var directions: Direction = Direction.new()
	var direction = directions.getRandomDirection()
	if node != null:
		node.move_and_collide( node.speed * direction)
	return direction

func breath_first(node: CharacterBody2D, targetNode: Node2D):
	var distances = Direction.directions.map(func (dir: Vector2):
			return pow(2,targetNode.position.length() - (dir * node.speed).length())
			)
	var minDistance = distances.min()
	var minDistanceIndex = distances.find(minDistance)
	var minDistanceVector = Direction.directions[minDistanceIndex] * node.speed
	var collision = node.move_and_collide(minDistanceVector)
