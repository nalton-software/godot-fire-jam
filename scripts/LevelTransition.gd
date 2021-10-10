extends ColorRect

export (float) var character_display_interval = 0.05
export (float) var new_line_pause_mulitplier = 4
var visible_characters = 0
var text = ''

func show_text(p_text: String):
	text = p_text
	$Information.text = ''
	$TypewriterTimer.wait_time = character_display_interval

func _input(event):
	if event is InputEventMouseButton and visible_characters == len(text):
		LevelManagement.load_level(LevelManagement.crnt_level_num)


func _on_TypewriterTimer_timeout():
	visible_characters += 1
	if visible_characters < len(text):
		$Information.text = text.substr(0, visible_characters + 1)
		var long_pause_needed = false
		if visible_characters < len(text) - 1:
			if text[visible_characters - 1] == '\n' and text[visible_characters] == '\n':
				long_pause_needed = true
		if long_pause_needed:
			$TypewriterTimer.wait_time = character_display_interval * 4
		else:
			$TypewriterTimer.wait_time = character_display_interval
	else:
		$TypewriterTimer.stop()
		$Prompt.show()
