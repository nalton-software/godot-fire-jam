extends CanvasLayer

onready var inventory = $"Control/InventoryItems"

func add_item(item: Item):
	var available_spots = get_tree().get_nodes_in_group("Empty")
	if len(available_spots) > 0:
		available_spots[0].set_item(item)

func remove_item(item: Item):
	# Find the last node containing item
	var filled_spots = get_tree().get_nodes_in_group("Filled")
	for i in range(len(filled_spots) - 1, -1, -1):
		if filled_spots[i].item == item:
			filled_spots[i].remove_item()
			break # only remove it once if there are duplicates

func _on_CraftingMenuButton_pressed():
	$CraftingMenu.popup()
