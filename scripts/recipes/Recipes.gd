extends Node

const Recipe = preload('res://scripts/recipes/Recipe.gd')

var data = {
	'Less wood' : Recipe.new('Less wood', {'wood' : 2}, {'wood' : 1}),
	'More wood' : Recipe.new('More wood', {'wood' : 2}, {'wood' : 3}),
}
