extends VBoxContainer

var peer_id

func _enter_tree():
	$Name.text = str(self.name)
	peer_id = name.to_int()
	print(peer_id)
	set_multiplayer_authority(peer_id)
	
func _on_namefield_text_changed(new_text):
	
	if not is_multiplayer_authority(): return
	
	## I NOTICED THAT WHEN CHANGING THE NAME OF THE HOST, THE PLAYER DATA IN THE GAMEMANAGER WAS NEVER UPDATED
	## IF YOU TRY AND MAKE AN RPC CALL TO YOURSELF IT SEEMS TO GO NOWHERE
	## A CHECK TO ONLY SEND THE CALL IF YOU'RE NOT THE RECIPIENT RESOLVES THIS
	## IF YOU'RE THE RECIPIENT, JUST UPDATE YOUR OWN GAMEMANAGER
	if(peer_id != 1):
		rpc_id(1, "SetPlayerName", peer_id, new_text)
	else:
		GAME_MANAGER.PLAYERS[peer_id].name = new_text

@rpc("any_peer")
func SetPlayerName(peer_id, new_name):
	GAME_MANAGER._Set_Player_Name(peer_id, new_name)

func _on_color_picker_button_color_changed(new_color):
	
	if not is_multiplayer_authority(): return
	
	if(peer_id != 1):
		rpc_id(1, "SetPlayerColor", peer_id, new_color)
	else:
		GAME_MANAGER.PLAYERS[peer_id].colour = new_color

@rpc("any_peer")
func SetPlayerColor(peer_id, new_color):
	GAME_MANAGER._Set_Player_Color(peer_id, new_color)
