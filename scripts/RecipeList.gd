extends Node

const Recipe = preload('res://scripts/Recipe.gd')

var data = [
	Recipe.new('Less wood', {'wood' : 2}, {'wood' : 1}),
	Recipe.new('More wood', {'wood' : 2}, {'wood' : 3}),
]
