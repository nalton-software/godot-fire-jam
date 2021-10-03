extends Node

var items = []
export (int) var max_items = 20

func _init():
	pass

func add_item(item: Resource):
	if not is_full():
		items.append(item)
		var hud = get_hud()
		if hud != null:
			hud.add_item(item)
	print(len(items))
	
func remove_item(item: Resource):
	if item in items:
		items.remove(items.find(item))
		var hud = get_hud()
		if hud != null:
			hud.remove_item(item)
	print(len(items))
		
func is_full():
	return len(items) >= max_items

func get_hud():
	var nodes = get_tree().get_nodes_in_group('HUDs')
	if len(nodes) == 0:
		return null
	else:
		return nodes[0]
