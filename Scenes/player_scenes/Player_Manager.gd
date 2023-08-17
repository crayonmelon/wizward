class_name Player_Data extends Node

@export var colour: Color
@export var peer_id: int
@export var player_name: String

func _enter_tree():
	peer_id = name.to_int()
	set_multiplayer_authority(peer_id)
	
func _set_colour(val):
	if not is_multiplayer_authority():  return
	colour = val

func _set_name(val):
	if not is_multiplayer_authority():  return
	player_name = val
