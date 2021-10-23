extends Node2D

func _on_PlayButton_pressed():
	LevelManagement.reset_crnt_level()


func _on_Website_pressed():
	OS.shell_open($CanvasLayer/Website.text)
