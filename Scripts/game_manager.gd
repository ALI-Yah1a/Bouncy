extends Node

var current_area = 1
var is_returning = false

var energy_cells = 0

func _ready():
	reset_energy_cells()

func next_level():
	if current_area == 1:
		current_area = 2
		is_returning = false
		reset_energy_cells()
		var full_path = "res://Scenes/area_" + str(current_area) + ".tscn"
		get_tree().change_scene_to_file(full_path)
		print("The player has entered the gate!")

func set_up_area():
	reset_energy_cells()
	
func add_energy_cell():
	energy_cells += 1
	if current_area == 1 and energy_cells >= 20:
		var portal = get_tree().get_first_node_in_group("gate") as Gate
		if portal:
			portal.open()

func reset_energy_cells():
	energy_cells = 0
