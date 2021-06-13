extends Area2D

export(String) var next_scene;

func _on_Goal_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().change_scene(next_scene);
