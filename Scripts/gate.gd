extends Area2D
class_name Gate

@onready var sprite_2d: Sprite2D = $Sprite2D


func _on_body_entered(body):
	if body is Player:
		GameManager.next_level()
