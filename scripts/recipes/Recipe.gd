extends Resource

class_name Recipe

const grid_size = Vector2(3, 3)

var name := ''
# 3x3 list of items names, use null for nothing 
var ingredients = []
var ingredient_quantities = {} # filled at ready, dict of { item name : qty }
 # name of an item
var output = ''

func _init(p_name, p_ingredients, p_output):
	name = p_name
	ingredients = p_ingredients
	output = p_output

	for item_name in ingredients:
		if item_name in ingredient_quantities:
			ingredient_quantities[item_name] += 1
		else:
			ingredient_quantities[item_name] = 1

func can_be_made(item_arrangement):
	# Item arrangment is list of item names
	for row_idx in range(grid_size.y):
		for col_idx in range(grid_size.x):
			if ingredients[row_idx][col_idx] != item_arrangement[row_idx][col_idx]:
				return false
	return true
