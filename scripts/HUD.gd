extends CanvasLayer

onready var inventory = $"Control/InventoryItems"
onready var inventory_item_prefab = preload("res://scenes/InventoryItem.tscn")

func add_item(item_data: ItemData):
	var inventory_item = inventory_item_prefab.instance()
	inventory_item.item_data = item_data
	inventory.add_child(inventory_item)
