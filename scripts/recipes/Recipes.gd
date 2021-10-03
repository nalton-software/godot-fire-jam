extends Node

const Recipe = preload('res://scripts/recipes/Recipe.gd')

var data = {
	'String' : Recipe.new('String', {'CottonFluff' : 3}, {'String' : 1}),
	'Half as much wood' : Recipe.new('Half as much wood', {'Wood' : 2}, {'Wood' : 1})
}
