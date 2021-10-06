extends Node

var items = []
export (int) var max_items = 9

func _init():
	clear_items()

func set_item_at_index(item: Resource, index: int, already_in_hud: bool = false):
	items[index] = item
	var hud = get_hud()
	if hud != null and not already_in_hud:
		hud.force_inventory_sync()

func add_item(item: Resource, already_in_hud: bool = false) -> bool:
	var empty_index = items.find(null)
	if empty_index != -1:
		items[empty_index] = item
		var hud = get_hud()
		if hud != null and not already_in_hud:
			hud.force_inventory_sync()
		return true
	return false
	
func clear_items():
	items = []
	for i in range(max_items):
		items.append(null)

func remove_item(index_or_item):
	var index = index_or_item if typeof(index_or_item) == TYPE_INT else items.find(index_or_item)
	items[index] = null
	var hud = get_hud()
	if hud != null:
		hud.remove_item(index)
		
func get_hud():
	var nodes = get_tree().get_nodes_in_group('HUDs')
	if len(nodes) == 0:
		return null
	else:
		return nodes[0]
