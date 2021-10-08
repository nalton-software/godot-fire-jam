extends "res://scripts/Main.gd"

var target_recipe: Recipe

func _ready():
	._ready()
	for recipe_name in Recipes.data:
		var recipe = Recipes.data[recipe_name]
		if recipe.output == target_item_name:
			target_recipe = recipe
