class_name walk extends Node2D

var directions: Direction = Direction.new()

func random():
	directions.directions.push_back(Vector2.ZERO)
	var direction = directions.getRandomDirection()
	var node = get_parent() 
	if node == null:
		return
	node.directionSignal.emit(direction)
	for i in range(node.speed.length()):
		await get_tree().create_timer(node.reactionTimeSec / node.speed.length()).timeout
		node.move_and_collide( (node.speed.length() / node.reactionTimeSec) * direction)

func nearestDirection(targetPosition: Vector2):
	var node = get_parent() 
	if node == null:
		return Vector2.ZERO
	var newTargetPosition = (targetPosition - node.position )
	var distances = Direction.directions.map(func (dir: Vector2):
			return (newTargetPosition - dir).angle()
			)
	var direction = Direction.directions[distances.find(distances.min())]
	return direction

func follow():
		var node = get_parent() 
		if node == null:
			return
		var targetPosition = (node.target.position - node.position  ).normalized()
		for i in range(node.speed.length()):
			await get_tree().create_timer(node.reactionTimeSec / node.speed.length()).timeout
			node.directionSignal.emit(nearestDirection(node.target.position))
			node.move_and_collide((node.speed.length() / node.reactionTimeSec) * targetPosition)
