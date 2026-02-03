extends Node

var current_area = 1
var energy_cells = 0

func _ready():
	reset_energy_cells()

func next_level():
	current_area += 1
	reset_energy_cells()
	
	var full_path = "res://Scenes/area_" + str(current_area) + ".tscn"
	get_tree().change_scene_to_file(full_path)
	print("The player has entered the gate to area " + str(current_area))

func set_up_area():
	reset_energy_cells()
	
func add_energy_cell():
	energy_cells += 1
	if current_area < 3 and energy_cells >= 30:
		var portal = get_tree().get_first_node_in_group("gate") as Gate
		if portal:
			portal.open()

func reset_energy_cells():
	energy_cells = 0
