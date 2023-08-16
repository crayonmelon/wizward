extends Node

var MAIN_GAME_NODE = preload("res://Scenes/main_game/MAIN_GAME_CONTAINER.tscn")
@export var PLAYERS = {}

func _Set_Player_Name(peer_id, name):
	PLAYERS[peer_id].name = name
	
func _Set_Player_Color(peer_id, color):
	var player_data = get_player_manager(peer_id)
	player_data._set_colour(color)
	
func _Get_Player_Name():
	pass

func get_player_manager(peer_id: int) -> Player_Data:
	var nodes_in_group = get_tree().get_nodes_in_group("Player_Manager")
	print(nodes_in_group)
	for node in nodes_in_group:
		print("multi_auth: ", peer_id)
		print("unique id: ", node.multiplayer.get_unique_id())
		
		if node.multiplayer.get_unique_id() == peer_id:
			return node
		
	return null
