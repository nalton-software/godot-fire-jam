extends CanvasLayer

onready var inventory = $"Control/InventoryItems"

func add_item(item_data: Item) -> bool:
	var available_spots = get_tree().get_nodes_in_group("Empty")
	if len(available_spots) == 0:
		return false
	
	available_spots[0].set_item(item_data)
	return true

func _on_CraftingMenuButton_pressed():
	$CraftingMenu.popup()
