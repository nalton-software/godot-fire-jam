extends ColorRect

func show_text(text: String):
	$Information.text = text

func _input(event):
	if event is InputEventMouseButton:
		LevelManagement.load_level(LevelManagement.crnt_level_num)
