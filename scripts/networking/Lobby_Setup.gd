extends Node

@onready var main_menu = $UI/MainMenu
@onready var address_entry = $UI/MainMenu/MarginContainer/VBoxContainer/AddressEntry

var names = ["Robert", "Jerry", "Garry", "Loser"]
var colours = [Color.RED, Color.BLUE, Color.GREEN, Color.YELLOW]

const PORT = 9999
var ip_address = "localhost"
var enet_peer = ENetMultiplayerPeer.new()

@onready var char_container = $CHARACTER_MAKER/MainMenu/MarginContainer/CM_CONTAINER
var char_maker = preload("res://Scenes/multiplayer/character_maker.tscn")
var PLAYER_MASTER = preload("res://Scenes/player_scenes/Player_Manager.tscn")

func _unhandled_input(event):
	if Input.is_action_just_pressed("QUIT"):
		get_tree().quit()

func _on_host_button_pressed():
	
	main_menu.hide()
	$Start_game.show()
	$CHARACTER_MAKER.show()
	
	enet_peer.create_server(PORT)
	multiplayer.multiplayer_peer = enet_peer
	
	multiplayer.peer_connected.connect(add_player)
	multiplayer.peer_disconnected.connect(remove_player)
	
	add_player(multiplayer.get_unique_id())
	
func _on_join_button_pressed():
	
	main_menu.hide()
	$CHARACTER_MAKER.show()
	
	enet_peer.create_client(ip_address, PORT)
	multiplayer.multiplayer_peer = enet_peer

func remove_player(peer_id):
	var player = get_node_or_null(str(peer_id))
	if player:
		player.queue_free()

func add_player(peer_id):
	
	var PLAYER_MASTER_inst = PLAYER_MASTER.instantiate()
	PLAYER_MASTER_inst.name = str(peer_id)
	GAME_MANAGER.add_child(PLAYER_MASTER_inst)
	
	#Add character Creator Node
	var char_maker_inst = char_maker.instantiate()
	char_maker_inst.name = str(peer_id)
	char_container.add_child(char_maker_inst)
	
func _on_start_game_pressed():
	var maingame = GAME_MANAGER.MAIN_GAME_NODE
	
	## PROLLY NEED A BETTER WAY TO GET ACCESS TO THE MAIN SCENE
	get_tree().get_root().get_node("MAIN").add_child(maingame.instantiate())
	$CHARACTER_MAKER.hide()
	queue_free()
