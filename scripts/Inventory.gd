extends Node

var items = []
export (int) var max_items = 9

func _init():
	pass

func add_item(item: Resource):
	if not is_full():
		items.append(item)
		var hud = get_hud()
		if hud != null:
			hud.add_item(item)
	
func remove_item(index_or_item):
	var index = index_or_item if typeof(index_or_item) == TYPE_INT else items.find(index_or_item)
	items[index] = null
	var hud = get_hud()
	if hud != null:
		hud.remove_item(index)
		
func is_full():
	return len(items) >= max_items

func get_hud():
	var nodes = get_tree().get_nodes_in_group('HUDs')
	if len(nodes) == 0:
		return null
	else:
		return nodes[0]
