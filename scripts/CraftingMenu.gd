extends PopupPanel

onready var recipeList = $VBoxContainer/HSplitContainer/RecipeList
onready var recipePanel = $VBoxContainer/HSplitContainer/VBoxContainer

var crnt_item

func _ready():
	populate_recipes()

func _on_CraftingMenu_about_to_show():
	get_tree().paused = true

func _on_CloseButton_pressed():
	hide()
	get_tree().paused = false

func populate_recipes():
	for recipe_name in Recipes.data:
		recipeList.add_item(recipe_name)
	recipeList.select(0)
	_on_RecipeList_item_selected(0)

func _on_RecipeList_item_selected(index):
	# Multiply index by 3 because of stupid godot
	var item_name = recipeList.items[index * 3]
	var crnt_item = Recipes.data[item_name]
	recipePanel.get_node('Heading').text = item_name
