class_name random_walk extends map

#@onready var ghost = preload("res://enemy/enemy_ghost/enemy_ghost.tscn")
#@onready var worm = preload("res://enemy/enemy_worm/enemy_worm.tscn")


var iterations: int = 400
var startingPosition: Vector2 = Vector2.ZERO
var roomNumber: int = 5
var hallwayLength: int = 2
var monsterQuantity: int  = 10

func generate():
	var floor: Dictionary = {}
	var direction: Direction = Direction.new()
	
	var fardestDir: Dictionary = {
		Vector2.UP: startingPosition,
		Vector2.RIGHT: startingPosition,
		Vector2.LEFT: startingPosition,
		Vector2.DOWN: startingPosition
	}
	
	var currentPosition = startingPosition
	var currentDirection: Vector2 = direction.getRandomDirection()
	for i in range(iterations):
		var isHallwayIteration: bool = i != 0 && (iterations -1 )!= i && i % (iterations / roomNumber) == 0
		if isHallwayIteration:
			for j in range(hallwayLength):
				currentPosition = fardestDir[currentDirection]
				currentPosition = addToFloor(floor,fardestDir,currentPosition,currentDirection)
				tileMap.set_cell(0,currentPosition,0,Vector2i(0,0))
			continue
		currentPosition = addToFloor(floor,fardestDir, currentPosition ,currentDirection)
		currentDirection = direction.getRandomDirection()
		tileMap.set_cell(0,currentPosition,0,Vector2i(0,0))
		
	var walls : Dictionary={}
		
	var wallTileNames : Dictionary={
		Vector2.UP: "up_wall",
		Vector2.RIGHT: "right_wall",
		Vector2.LEFT: "left_wall",
		Vector2.DOWN: "down_wall"
	}
		
	for position in floor.keys():
		for direction2 in direction.directions:
			var neighbor_position:Vector2 = position + direction2
			if(tileMap.get_cell_source_id(0,position + direction2)== -1):
				walls[neighbor_position] = wallTileNames[direction2]
				tileMap.set_cell(0,neighbor_position,1,Vector2i(0,0))
				
	var sortedFloor = floor.keys().duplicate()
	sortedFloor.sort()
#	var vi = platform.instantiate()
	
#	var monsterSelection = [
#		worm,
#		ghost
#	]
	
	var i  = 0
	for pos in sortedFloor:
		if i % monsterQuantity == 0 && i !=0:
#			monsterSelection.shuffle()
#			tileMap.add_child(monsterSelection[0].instantiate())
			pass
		i+=1
		pass
func addToFloor(floor: Dictionary,fardestDir: Dictionary, currentPosition: Vector2 ,currentDirection: Vector2):
	currentPosition += currentDirection
	currentPosition = fardestDir[currentDirection] + currentDirection if floor.has(currentPosition) else currentPosition
	fardestDir[currentDirection] = currentPosition if fardestDir[currentDirection] < currentPosition  else fardestDir[currentDirection]
	floor[currentPosition] = true;
	return currentPosition
