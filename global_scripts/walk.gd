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
		node.move_and_collide( i * direction)

func nearestDirection(targetPosition: Vector2):
	var node = get_parent() 
	if node == null:
		return Vector2.ZERO
	var distances = Direction.directions.map(func (dir: Vector2):
			return targetPosition - dir
			)
	var direction = Direction.directions[distances.find(distances.min())]
	return direction

func follow():
		var node = get_parent() 
		if node == null:
			return
		var targetPosition = node.target.position / node.speed
		for i in range(targetPosition.length()):
			var fraction: Vector2 = (targetPosition / targetPosition.length()) * i
			node.directionSignal.emit(nearestDirection(fraction))
			await get_tree().create_timer(node.reactionTimeSec / node.speed.length()).timeout
			node.move_and_collide(fraction)
