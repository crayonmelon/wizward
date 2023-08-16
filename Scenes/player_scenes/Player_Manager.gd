class_name Player_Data extends Node

@export var colour: Color
@export var peer_id: int
@export var player_name: String

func _setup(peer_id):

	self.peer_id = peer_id
	set_multiplayer_authority(peer_id)
	
	if not is_multiplayer_authority(): return
	
func _ready():
	
	print(get_multiplayer_authority())

func _set_colour(val):
	colour = val

func _set_name(val):
	player_name = val
