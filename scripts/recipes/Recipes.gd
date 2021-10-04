extends Node

const Recipe = preload('res://scripts/recipes/Recipe.gd')

var data = {
	'String' : Recipe.new('String', [
		[null, 'Cotton Fluff', null],
		['Cotton Fluff', 'Cotton Fluff', 'Cotton Fluff'],
		[null, 'Cotton Fluff', null]
	], ['String'])
}
