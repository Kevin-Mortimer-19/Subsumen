extends Area2D

const MAN = preload("res://entities/Player.tscn")

var RED = load("res://sprites/C1.png")
var BLUE = load("res://sprites/C2.png")

func _on_PurpleSplit_body_entered(body):
	if body.is_in_group("Player"):
		var c1 = MAN.instance()
		body.get_parent().add_child(c1)
		c1.get_node("Sprite").texture = RED
		c1.global_position = global_position + Vector2(-96,-32)
		c1.character_number = 2
		
		var c2 = MAN.instance()
		body.get_parent().add_child(c2)
		c2.get_node("Sprite").texture = BLUE
		c2.global_position = global_position + Vector2(32,-32)
		c2.character_number = 1
		body.queue_free()
