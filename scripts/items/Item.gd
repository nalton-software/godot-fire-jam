extends Resource

class_name Item

export (String) var name
export (StreamTexture) var texture
export (Vector2) var size

func _init(p_name, p_texture, p_size):
	name = p_name
	texture = p_texture
	size = p_size
