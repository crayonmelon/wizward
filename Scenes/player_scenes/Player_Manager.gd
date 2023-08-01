extends Node

@export var PLAYER_DATA : Player_Class

var peer_id

func _setup(peer_id):

	self.peer_id = peer_id
	set_multiplayer_authority(peer_id)
	
	if not is_multiplayer_authority(): return
	
func _ready():
	
	PLAYER_DATA = PLAYER_DATA.new()
	
	print(get_multiplayer_authority())
