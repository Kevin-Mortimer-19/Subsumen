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
	global_position += vel.normalized()*move_speed
