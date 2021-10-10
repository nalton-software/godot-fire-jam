extends "res://scripts/Main.gd"

class Prompt:
	var text: String
	var can_skip: bool
	
	func _init(p_text, p_can_skip = true):
		text = p_text
		can_skip = p_can_skip

onready var prompt_area = $"Prompts"
var prompts := {
	'welcome' : Prompt.new('Welcome to <game name here>'),
	'goal' : Prompt.new('Your goal is to craft the item shown in the top right'),
	'pickup_items' : Prompt.new('Pick up items on the ground by walking over them', false),
	'inventory_help' : Prompt.new('Drag items in your inventory to move them'),
	'drop_items' : Prompt.new('To remove an item from your inventory, drag it onto the ground'),
	'crafting_menu' : Prompt.new('Now click the "Crafting" button', false),
	'crafting_hints' : Prompt.new('On the left are hints to help you craft'),
	'crafting_hints_2' : Prompt.new('These will be very useful in later levels when the recipes are complex'),
	'crafting_square' : Prompt.new('On the right is a crafting grid'),
	'crafting_square_2' : Prompt.new('Arrange items in the shape of the target object to craft it', false),
	'finished_crafting' : Prompt.new('To finish, place the crafted item back in your inventory', false)
}
var crnt_prompt_name = null

func _ready():
	._ready()

func _process(delta: float):
	._process(delta)
	
	display_prompt()

func display_prompt():
	if crnt_prompt_name == null:
		crnt_prompt_name = prompts.keys()[0]
	
	if get_prompt_index(crnt_prompt_name) <= get_prompt_index('pickup_items'):
		if Inventory.get_item_count() == 3:
			crnt_prompt_name = 'inventory_help'
	elif get_prompt_index(crnt_prompt_name) <= get_prompt_index('crafting_menu'):
		if $HUD/CraftingMenu.is_visible_in_tree():
			crnt_prompt_name = 'crafting_hints'
	elif get_prompt_index(crnt_prompt_name) <= get_prompt_index('crafting_square_2'):
		var has_target_item = false
		for item_slot in $HUD/CraftingMenu.item_slots:
			if item_slot.item == null:
				continue
			if item_slot.item.name == target_item_name:
				has_target_item = true
				break
		if has_target_item:
			crnt_prompt_name = 'finished_crafting'
			
	if prompts[crnt_prompt_name].can_skip and \
		get_prompt_index(crnt_prompt_name) < len(prompts.keys()) - 1:
		prompt_area.get_node("ClickToContinue").text = 'Click for next prompt'
		if Input.is_action_just_pressed("next_prompt"):
			crnt_prompt_name = prompts.keys()[get_prompt_index(crnt_prompt_name) + 1]
	else:
		prompt_area.get_node("ClickToContinue").text = 'Follow the prompt\'s instructions to continue'
		
	prompt_area.get_node("Label").text = prompts[crnt_prompt_name].text
	
func get_prompt_index(prompt_name):
	return prompts.keys().find(prompt_name)
