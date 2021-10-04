extends CanvasLayer

onready var inventory = $"InventoryItems"

func add_item(item: Item):
	var available_spots = get_tree().get_nodes_in_group("Empty")
	if len(available_spots) > 0:
		available_spots[0].set_item(item)

func remove_item(index: int):
	var spots = inventory.get_children()
	spots[index].remove_item()

func _on_CraftingMenuButton_pressed():
	$CraftingMenu.popup()
