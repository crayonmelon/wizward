extends Node3D

const BOARD_GAME_SCENE = preload("res://Scenes/main_game/the_board.tscn")
const player_pawn = preload("res://Scenes/player_scenes/Player_pawn.tscn")
var Board_Inst
var player_inst

func _ready():
	
	set_multiplayer_authority(1)
	#If not host fuck off
	if not is_multiplayer_authority(): return
	
	Board_Inst = BOARD_GAME_SCENE.instantiate()
	#If is server add The board scene
	add_child(Board_Inst)
	
	for player in get_tree().get_nodes_in_group("Player_Manager"):
		player_inst = player_pawn.instantiate()
		player_inst.name = str(player.peer_id)
		add_child(player_inst)
