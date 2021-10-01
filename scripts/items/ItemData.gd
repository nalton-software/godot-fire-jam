extends Resource

class_name ItemData

export (String) var name
export (StreamTexture) var texture

func _init(p_name, p_texture):
	name = p_name
	texture = p_texture
	
