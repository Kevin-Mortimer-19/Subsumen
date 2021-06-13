extends Area2D

const MAN = preload("res://entities/Player.tscn")

var RED = load("res://sprites/C1.png")
var BLUE = load("res://sprites/C2.png")

func _on_PurpleSplit_body_entered(body):
	if body.is_in_group("Player"):
		var c1 = MAN.instance()
		c1.get_node("Sprite").texture = RED
		c1.global_position = global_position - Vector2(64,0)
		c1.character_number = RED
		
		var c2 = MAN.instance()
		c2.get_node("Sprite").texture = BLUE
		c2.global_position = global_position + Vector2(64,0)
		c2.character_number = BLUE
#		body.queue_free()
