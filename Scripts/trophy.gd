extends StaticBody2D

@export var bounce_force := -700

func _on_area_2d_body_entered(body):
	if body.name == "Player" or body.is_in_group("Player"):
		body.velocity.y = bounce_force
