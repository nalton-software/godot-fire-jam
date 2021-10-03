extends PopupMenu

func _ready():
	populate_recipes()

func _on_CloseButton_pressed():
	hide()

func populate_recipes():
	for recipe in Recipes.data:
		print(recipe.name)
