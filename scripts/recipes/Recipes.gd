extends Node

const Recipe = preload('res://scripts/recipes/Recipe.gd')

var data = {
	'String' : Recipe.new('String', [
		[null, null, null],
		['Cotton Fluff', 'Cotton Fluff', 'Cotton Fluff'],
		[null, null, null]
	], 'String'),
	'Cart' : Recipe.new('Cart', [
		['Wood', null, 'Wood'],
		['Wood', 'Wood', 'Wood'],
		['Stone', null, 'Stone']
	], 'Cart'),
	'Axe' : Recipe.new('Axe', [
		[null, 'Wood', 'Stone'],
		[null, 'Wood', 'Stone'],
		[null, 'Wood', null]
	], 'Axe')
}
