extends Node

const Item = preload('res://scripts/items/Item.gd')

var data = {
	'Wood' : Item.new('Wood', preload('res://art/wood.png'), Vector2(32, 32)),
	'Rock' : Item.new('Rock', preload('res://art/rock.png'), Vector2(32, 32)),
	'String' : Item.new('String', preload('res://art/string.png'), Vector2(32, 32)),
	'CottonFluff' : Item.new('CottonFluff', preload('res://art/cotton_fluff.png'), Vector2(32, 32)),
}
