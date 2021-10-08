extends CanvasLayer

onready var inventory = $"InventoryItems"
onready var item_slots = inventory.get_children()

func force_inventory_sync():
	for item_idx in len(Inventory.items):
		var crnt_item = Inventory.items[item_idx]
		if crnt_item != null:
			item_slots[item_idx].set_item(crnt_item, true)

func add_item(item: Item, index: int = -1):
	if index == -1:
		for item_slot in item_slots:
			if item_slot.is_empty():
				item_slot.set_item(item)
	else:
		item_slots[index].set_item(item)

func remove_item(index: int):
	item_slots[index].remove_item()
	
func set_target_item(item: Item):
	if item == null:
		$TargetItem.hide()
	else:
		$TargetItem.show()
		$TargetItem/Image.texture = item.texture

func _on_CraftingMenuButton_pressed():
	$CraftingMenu.show()
