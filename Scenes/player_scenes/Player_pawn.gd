extends RigidBody3D

var peer_id
var player_data : Player_Data

func _enter_tree():
	peer_id = name.to_int()
	set_multiplayer_authority(peer_id)
	
	player_data = GAME_MANAGER.get_player_manager(peer_id)
	
	set_player_data()

func set_player_data():
	var player_material = $Pawn.get_active_material(0)
	player_material.albedo_color = player_data.colour
