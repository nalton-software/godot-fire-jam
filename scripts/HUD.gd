extends CanvasLayer

onready var inventory = $"InventoryItems"
onready var item_slots = inventory.get_children()

func add_item(item: Item, index: int):
	item_slots[index].set_item(item)

func remove_item(index: int):
	var spots = inventory.get_children()
	item_slots[index].remove_item()

func _on_CraftingMenuButton_pressed():
	$CraftingMenu.show()
