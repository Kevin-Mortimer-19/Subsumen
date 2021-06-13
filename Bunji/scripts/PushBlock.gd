extends KinematicBody2D

export var tile_size = 64;

func mov(vel):
	global_position.x += tile_size*vel.x
	global_position.y += tile_size*vel.y