extends Node

const Recipe = preload('res://scripts/recipes/Recipe.gd')

var data = {
	'String' : Recipe.new('String', [
		[null, 'Cotton Fluff', null],
		['Cotton Fluff', 'Cotton Fluff', 'Cotton Fluff'],
		[null, 'Cotton Fluff', null]
	], 'String'),
	'Magic Stone' : Recipe.new('Magic Stone', [
		[null, null, null],
		['Wood', 'Cotton Fluff', null],
		[null, null, null]
	], 'Stone'),
	'Cart' : Recipe.new('Cart', [
		['Wood', null, 'Wood'],
		['Wood', 'Wood', 'Wood'],
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
