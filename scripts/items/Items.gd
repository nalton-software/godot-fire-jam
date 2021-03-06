extends Node

const Item = preload('res://scripts/items/Item.gd')

var data = {
	'Wood' : Item.new('Wood', preload('res://art/wood.png'), Vector2(48, 48)),
	'Stone' : Item.new('Stone', preload('res://art/stone.png'), Vector2(48, 48)),
	'Arrow' : Item.new('Arrow', preload('res://art/arrow.png'), Vector2(48, 48)),
	'Cotton Fluff' : Item.new('Cotton Fluff', preload('res://art/cotton_fluff.png'), Vector2(48, 48)),
	'String' : Item.new('String', preload('res://art/string.png'), Vector2(48, 48)),
	'Cloth' : Item.new('Cloth', preload('res://art/cloth.png'), Vector2(48, 48)),
	'Hat' : Item.new('Hat', preload('res://art/hat.png'), Vector2(48, 48)),
	'Cart' : Item.new('Cart', preload('res://art/cart.png'), Vector2(48, 48)),
	'Plank' : Item.new('Plank', preload('res://art/plank.png'), Vector2(48, 48)),
	'Axe' : Item.new('Axe', preload('res://art/axe.png'), Vector2(48, 48)),
	'Pickaxe' : Item.new('Pickaxe', preload('res://art/pickaxe.png'), Vector2(48, 48)),
	'Iron Ore' : Item.new('Iron Ore', preload('res://art/iron_ore.png'), Vector2(48, 48)),
	'Wire' : Item.new('Wire', preload('res://art/wire.png'), Vector2(48, 48)),
	'Girder' : Item.new('Girder', preload('res://art/girder.png'), Vector2(48, 48)),
	'Oil Well' : Item.new('Oil Well', preload('res://art/oil_well.png'), Vector2(48, 48)),
}
