extends Node

const level_path_format = 'res://scenes/levels/%s.tscn'
const level_transition_scene_prefab = preload('res://scenes/LevelTransition.tscn')
var crnt_level_num := 1

func load_level(level_num: int):
	var level_name = str(level_num).pad_zeros(2)
	get_tree().change_scene(level_path_format % level_name)

func reset_crnt_level():
	load_level(crnt_level_num)

func transition_to_next_level():
	var level_transition_scene = level_transition_scene_prefab.instance()
	level_transition_scene.show_text(get_tree().current_scene.finished_level_text)
	get_tree().current_scene.queue_free()
	get_tree().root.add_child(level_transition_scene)
	get_tree().current_scene = level_transition_scene
