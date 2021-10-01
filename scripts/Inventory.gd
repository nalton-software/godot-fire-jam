extends Resource

var items = []
export (int) var max_items = 20

func _init():
	pass

func add_item(item: Resource):
	if len(items) < max_items:
		items.append(item)

func remove_item():
	pass
