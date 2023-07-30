extends Node

var MAIN_GAME_NODE = preload("res://Scenes/main_game/MAIN_GAME_CONTAINER.tscn")
@export var PLAYERS = {}

func _Set_Player_Name(peer_id, name):
	PLAYERS[peer_id].name = name
	
func _Set_Player_Color(peer_id, color):
	PLAYERS[peer_id].colour = color

func _Get_Player_Name():
	pass
