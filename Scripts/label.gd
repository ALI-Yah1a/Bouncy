extends Label

func _process(delta):
	text = "Energy: " + str(GameManager.score)
