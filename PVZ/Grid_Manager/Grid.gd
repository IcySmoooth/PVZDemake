extends TileMap


# For now this is the array that stores whether a plant exists on a grid in the field
var tile_size = get_cell_size()
var half_tile_size = tile_size / 2

export var grid_size = Vector2(9, 5)
var grid = []


# Use the ready function to make the array
func _ready() -> void:
	for x in range(grid_size.x):
		grid.append([])
		for _y in range(grid_size.y):
			grid[x].append(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
# Maybe make a function where it takes in the position that the plant should be placed in and check if it can go in that spot
func Plant_Check(plantPos):
	# Returns true if a plant does not exist on the specified tile in the matrix
	return grid[plantPos] == 0
