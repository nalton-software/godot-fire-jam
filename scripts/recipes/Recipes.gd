extends Node

const Recipe = preload('res://scripts/recipes/Recipe.gd')

var data = {
	'String' : Recipe.new('String', [
		[null, null, null],
		['Cotton Fluff', 'Cotton Fluff', 'Cotton Fluff'],
		[null, null, null]
	], 'String'),
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
	'Plank' : Recipe.new('Plank', [
		[null, null, null],
		['Wood', 'Wood', 'Wood'],
		[null, null, null],
	], 'Plank')
}
