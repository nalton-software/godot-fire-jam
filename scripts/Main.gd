extends Node2D

export (int) var num_objects = 300
export (Vector2) var max_object_distance = Vector2(2500, 1250)
export (Array, PackedScene) var objects_to_spawn = []

func _ready():
	randomize()
	for i in range(num_objects):
		var obj = objects_to_spawn[randi() % len(objects_to_spawn)].instance()
		obj.position = Vector2(
			rand_range(-max_object_distance.x, max_object_distance.x),
			rand_range(-max_object_distance.y, max_object_distance.y)
		)
		$YSort.add_child(obj)
