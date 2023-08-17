extends Node

var peer_id
var Player_data 

func _enter_tree():
	$Name.text = str(self.name)
	peer_id = name.to_int()
	set_multiplayer_authority(peer_id)
	
	if not is_multiplayer_authority(): return
	
	Player_data = GAME_MANAGER.get_player_manager(peer_id)
	print("PLAYER DATA:", Player_data)
	
func _on_namefield_text_changed(new_text):
	
	if not is_multiplayer_authority(): return
	
	

@rpc("any_peer")
func SetPlayerName(peer_id, new_name):
	GAME_MANAGER._Set_Player_Name(peer_id, new_name)

func _on_color_picker_button_color_changed(new_color):
	
	if not is_multiplayer_authority(): return
	
	GAME_MANAGER._Set_Player_Color(peer_id, new_color)
	

@rpc("any_peer")
func SetPlayerColor(peer_id, new_color):
	var nodes_in_group = get_tree().get_nodes_in_group("Player_Manager")
	print(nodes_in_group)
	GAME_MANAGER._Set_Player_Color(peer_id, new_color)
