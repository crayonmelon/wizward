extends VBoxContainer

var peer_id

func _enter_tree():
	$Name.text = str(self.name)
	peer_id = name.to_int()
	print(peer_id)
	set_multiplayer_authority(peer_id)
	
func _on_namefield_text_changed(new_text):
	
	if not is_multiplayer_authority(): return
	
	rpc_id(1, "SetPlayerName", peer_id, new_text)


func _on_color_picker_button_color_changed(color):
	
	if not is_multiplayer_authority(): return
	print(GAME_MANAGER.PLAYERS.size())
	#GAME_MANAGER.PLAYERS[peer_id].colour = color	

@rpc("any_peer")
func SetPlayerName(peer_id, new_name):
	GAME_MANAGER._Set_Player_Name(peer_id, new_name)
 
