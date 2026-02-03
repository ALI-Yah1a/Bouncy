extends Area2D

func _on_body_entered(body):
	if body is Player:
		GameManager.add_energy_cell()
		queue_free()
