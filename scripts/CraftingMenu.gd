extends PopupPanel

onready var recipeList = $VBoxContainer/HSplitContainer/RecipeList
onready var recipePanel = $VBoxContainer/HSplitContainer/VBoxContainer

func _ready():
	populate_recipes()

func _on_CraftingMenu_about_to_show():
	#get_tree().paused = true
	pass

func _on_CloseButton_pressed():
	hide()
	#get_tree().paused = false

func populate_recipes():
	for recipe_name in Recipes.data:
		recipeList.add_item(recipe_name)
	recipeList.select(0)
	_on_RecipeList_item_selected(0)

func _on_RecipeList_item_selected(index):
	# Multiply index by 3 because of stupid godot
	var recipe_name = recipeList.items[index * 3]
	var crnt_recipe = Recipes.data[recipe_name]
	recipePanel.get_node('Heading').text = recipe_name
	recipePanel.get_node('Ingredients').text = 'Required resources:'
	for item_name in crnt_recipe.ingredients:
		var quantity = crnt_recipe.ingredients[item_name]
		recipePanel.get_node('Ingredients').text += '\n%sx %s' % [quantity, item_name] 
	recipePanel.get_node('Outputs').text = 'Produces:'
	for item_name in crnt_recipe.outputs:
		var quantity = crnt_recipe.outputs[item_name]
		recipePanel.get_node('Outputs').text += '\n%sx %s' % [quantity, item_name] 


func _on_CraftButton_pressed():
	pass # Replace with function body.
