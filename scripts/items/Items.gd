extends Node

const Item = preload('res://scripts/items/Item.gd')

var data = {
	'Wood' : Item.new('Wood', preload('res://art/wood.png'), Vector2(48, 48)),
	'Stone' : Item.new('Stone', preload('res://art/stone.png'), Vector2(48, 48)),
	'String' : Item.new('String', preload('res://art/string.png'), Vector2(48, 48)),
	'Cotton Fluff' : Item.new('Cotton Fluff', preload('res://art/cotton_fluff.png'), Vector2(48, 48)),
	'Cart' : Item.new('Cart', preload('res://art/cart.png'), Vector2(48, 48)),
	'Plank' : Item.new('Plank', preload('res://art/plank.png'), Vector2(48, 48)),
	'Axe' : Item.new('Axe', preload('res://art/axe.png'), Vector2(48, 48)),
	'Pickaxe' : Item.new('Pickaxe', preload('res://art/pickaxe.png'), Vector2(48, 48))
}
