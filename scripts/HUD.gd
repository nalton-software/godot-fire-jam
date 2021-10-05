extends CanvasLayer

onready var inventory = $"InventoryItems"
onready var item_slots = inventory.get_children()

func add_item(item: Item, index: int = -1):
	if index == -1:
		for item_slot in item_slots:
			if item_slot.is_empty():
				item_slot.set_item(item)
	else:
		item_slots[index].set_item(item)

func remove_item(index: int):
	var spots = inventory.get_children()
	item_slots[index].remove_item()

func _on_CraftingMenuButton_pressed():
	$CraftingMenu.show()
