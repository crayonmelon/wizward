extends RigidBody3D

var peer_id
var player_data

func _enter_tree():
	peer_id = name.to_int()
	set_multiplayer_authority(peer_id)
	## PLAYER CLASS CREATED FROM THE CONTENTS OF A DICTIONARY CAN BE SEEN HERE
	set_player_data(Player_Class.new(GAME_MANAGER.PLAYERS[peer_id]))

func set_player_data(player_data: Player_Class):
	var player_material = $Pawn.get_active_material(0)
	player_material.albedo_color = player_data.colour
	
