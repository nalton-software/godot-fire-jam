extends Node

const Recipe = preload('res://scripts/recipes/Recipe.gd')

var data = {
	# Level-target recipes
	'Arrow' : Recipe.new('Arrow', [
		[null, null, 'Stone'],
		[null, 'Plank', null],
		['Plank', null, null]
	], 'Arrow'),
	'Cart' : Recipe.new('Cart', [
		['Plank', 'Plank', 'Plank'],
		['Plank', 'Plank', 'Plank'],
		['Stone', null, 'Stone']
	], 'Cart'),
	'Axe' : Recipe.new('Axe', [
		[null, 'Stone', 'Plank'],
		[null, 'Plank', 'Stone'],
		['Plank', null, null],
	], 'Axe'),
	'Pickaxe' : Recipe.new('Pickaxe', [
		[null, 'Stone', 'Stone'],
		[null, 'Stone', 'Stone'],
		['Stone', null, null],
	], 'Pickaxe'),
	'Hat' : Recipe.new('Hat', [
		[null, 'Cloth', null],
		['Cloth', 'Cloth', 'Cloth'],
		[null, null, null],
	], 'Hat'),
	'Oil Well' : Recipe.new('Oil Well', [
		[null, 'Girder', null],
		['Girder', 'Wire', 'Girder'],
		['Girder', 'Wire', 'Girder'],
	], 'Oil Well'),
	
	# Subrecipes used to achieve the target items
	#'String' : Recipe.new('String', [
	#	[null, null, null],
	#	['Cotton Fluff', 'Cotton Fluff', 'Cotton Fluff'],
	#	[null, null, null]
	#], 'String'),
	'Cloth' : Recipe.new('Cloth', [
		['Cotton Fluff', null, 'Cotton Fluff'],
		[null, null, null],
		['Cotton Fluff', null, 'Cotton Fluff']
	], 'Cloth'),
	'Plank' : Recipe.new('Plank', [
		[null, null, null],
		['Wood', 'Wood', 'Wood'],
		[null, null, null],
	], 'Plank'),
	'Wire' : Recipe.new('Wire', [
		[null, 'Iron Ore', null],
		[null, 'Iron Ore', null],
		[null, 'Iron Ore', null],
	], 'Wire'),
	'Girder' : Recipe.new('Girder', [
		['Iron Ore', 'Iron Ore', 'Iron Ore'],
		[null, null, null],
		['Iron Ore', 'Iron Ore', 'Iron Ore'],
	], 'Girder')
}
