extends Node

const Item = preload('res://scripts/items/Item.gd')

var data = {
	'Wood' : Item.new('Wood', preload('res://art/wood.png'), Vector2(48, 48)),
	'Rock' : Item.new('Rock', preload('res://art/rock.png'), Vector2(48, 48)),
	'String' : Item.new('String', preload('res://art/string.png'), Vector2(48, 48)),
}
