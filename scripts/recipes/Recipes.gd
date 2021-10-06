extends Node

const Recipe = preload('res://scripts/recipes/Recipe.gd')

var data = {
	'Cart' : Recipe.new('Cart', [
		['Plank', 'Plank', 'Plank'],
		['Plank', 'Plank', 'Plank'],
		['Stone', null, 'Stone']
	], 'Cart'),
	'Axe' : Recipe.new('Axe', [
		[null, 'Plank', 'Stone'],
		[null, 'Plank', 'Stone'],
		[null, 'Plank', null],
	], 'Axe'),
	'Pickaxe' : Recipe.new('Pickaxe', [
		[null, 'Stone', 'Stone'],
		[null, 'Stone', 'Stone'],
		[null, 'Stone', null],
	], 'Pickaxe'),
	
	'String' : Recipe.new('String', [
		[null, null, null],
		['Cotton Fluff', 'Cotton Fluff', 'Cotton Fluff'],
		[null, null, null]
	], 'String'),
	'Cloth' : Recipe.new('Cloth', [
		['String', null, 'String'],
		[null, 'String', null],
		['String', null, 'String']
	], 'Cloth'),
	'Plank' : Recipe.new('Plank', [
		[null, null, null],
		['Wood', 'Wood', 'Wood'],
		[null, null, null],
	], 'Plank')
}
