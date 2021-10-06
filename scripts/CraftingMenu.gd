extends Panel

const RecipeHint = preload('res://scenes/RecipeHint.tscn')
onready var item_slots = $"VBoxContainer/HSplitContainer/VBoxContainer/CraftingGrid".get_children()
var crnt_recipe

func _ready():
	populate_recipe_hints()
	hide()

func _on_CloseButton_pressed():
	close()

func close():
	for item_slot in get_tree().get_nodes_in_group('ItemSlots'):
		if is_a_parent_of(item_slot):
			if item_slot.item != null:
				Inventory.add_item(item_slot.item)
				item_slot.remove_item()
	hide()

func populate_recipe_hints():
	for recipe_name in Recipes.data:
		var recipe_hint = RecipeHint.instance()
		recipe_hint.recipe = Recipes.data[recipe_name]
		$VBoxContainer/HSplitContainer/RecipeHints/VBoxContainer.add_child(recipe_hint)

func _on_CraftButton_pressed():
	var item_names = []
	for node in item_slots:
		item_names.append(node.item_name())
	
	var nested_item_names = Utils.chunk_list(item_names, 3)
	
	# Check all of the recipes to see which one can be built
	for crnt_recipe_name in Recipes.data:
		var crnt_recipe = Recipes.data[crnt_recipe_name]
		if crnt_recipe.can_be_made(nested_item_names):
			# Use the non-nested array we have instead of de-nesting the recipe's data
			for ingredient_idx in range(len(item_names)):
				var ingredient_name = item_names[ingredient_idx]
				item_slots[ingredient_idx].remove_item()
				if ingredient_name == null:
					continue
			
			# Add crafted item to center of crafting square
			item_slots[4].set_item(Items.data[crnt_recipe.output])
			
			# Only build one recipe
			break
