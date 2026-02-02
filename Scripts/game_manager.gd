extends Node

var current_area = 1
func next_level():
	current_area += 1
	var full_path = "res://Scenes/area_" + str(current_area) + ".tscn"
	get_tree().change_scene_to_file(full_path)
	print("The player has entered the gate!")
