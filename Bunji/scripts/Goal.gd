extends Area2D



func _on_Goal_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().change_scene("res://scenes/End Screen.tscn")
