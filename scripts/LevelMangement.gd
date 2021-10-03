extends Node

const level_path_format = 'res://scenes/levels/%s.tscn'
var crnt_level_num := 1

func finish_crnt_level():
	crnt_level_num += 1

func load_level(level_num: int):
	var level_name = str(level_num).pad_zeros(2)
	get_tree().change_scene(level_path_format % level_name)

func reset_crnt_level():
	load_level(crnt_level_num)
