extends Node

var current_area = 1
var is_returning = false

func next_level():
	if current_area == 1:
		current_area = 2
		is_returning = false
	else:
		current_area = 1
		is_returning = true
	var full_path = "res://Scenes/area_" + str(current_area) + ".tscn"
	get_tree().change_scene_to_file(full_path)
	print("The player has entered the gate!")
