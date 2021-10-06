extends HBoxContainer

export (DynamicFont) var font
var recipe: Recipe
var min_image_size = Vector2(32, 32)

func _ready():
	var is_first_item = true
	print('Recipe: %s' % recipe.name)
	for item_name in recipe.ingredient_quantities:
		var label_text = '%s x ' % recipe.ingredient_quantities[item_name]
		if not is_first_item:
			label_text = ' + ' + label_text
		add_label(label_text)
		add_image(Items.data[item_name].texture)
		
		is_first_item = false
	add_label(' = ')
	add_image(Items.data[recipe.output].texture)
	
func add_label(text):
	var label = Label.new()
	label.add_font_override('font', font)
	label.size_flags_horizontal = SIZE_EXPAND_FILL
	label.size_flags_vertical = SIZE_EXPAND_FILL
	label.text = text
	add_child(label)
	
func add_image(texture):
	var texture_rect = TextureRect.new()
	texture_rect.texture = texture
	texture_rect.stretch_mode = texture_rect.STRETCH_KEEP_ASPECT_CENTERED
	texture_rect.expand = true
	texture_rect.rect_min_size = min_image_size
	add_child(texture_rect)
