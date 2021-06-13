extends KinematicBody2D

# Declare member variables here. Examples:
var vel 
var move_speed = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func init(v):
	vel = v
	if(vel.x == 0 && vel.y == 0):
		vel.y -= 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#global_position += vel.normalized()*move_speed
	var collision = move_and_collide(vel.normalized()*move_speed)
	if collision != null:
		if collision.get_collider().get_collision_layer() > 1:
			delete()

#func _on_Bullet_body_entered(body):
func delete():
	queue_free()
