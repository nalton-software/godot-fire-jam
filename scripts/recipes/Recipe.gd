extends Resource

class_name Recipe

var name := ''
# These two are in form { item_name : quantity }
var ingredients := {}
var outputs := {}

func _init(p_name, p_ingredients, p_outputs):
	name = p_name
	ingredients = p_ingredients
	outputs = p_outputs

func can_be_made(available_items):
	# Can this recipe be made with the items in the list of Items available_items?
	var available_items_dict = {}
	for item in available_items:
		if item.name in available_items_dict:
			available_items_dict[item.name] += 1
		else:
			available_items_dict[item.name] = 1
	var can_be_made = true
	for item_name in available_items_dict:
		if not (item_name in available_items_dict):
			can_be_made = false
			break
		if available_items_dict[item_name] < ingredients[item_name]:
			can_be_made = false
			break
	return can_be_made
