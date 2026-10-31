extends Node2D

var enemy_pokemon
var enemy_current_move
var state: String
var round: int = 0

@onready var game_state: Label = $GameState
@onready var total_pokemon: Node2D = $TotalPokemon
@onready var moves: Control = %Moves
@onready var round_label: Label = $Round
@onready var button: Button = $Button



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass

func start_round():
	#change the turn order based on specific requirements
	#random for now
	#rerender the scene
	round += 1
	round_label.text = "Round " + str(round)
	generate_pokemon()
	if Global.turn_order[Global.turn] == Global.current_pokemon:
		player_turn()
	else:
		ai_turn()
	#play the ai turn




func _on_apply_moves_pressed() -> void:
	Global.current_pokemon.generate_hearts(Global.current_move)

#appeal

#add pokemon created in the global scene and sets their variables
func generate_pokemon() -> void:
	var ypos = 50
	for i in Global.turn_order.size():
		var poke = Global.turn_order[i]
		
		poke.position.y = ypos
		ypos+= 50
		total_pokemon.add_child(poke)
		poke.set_variables(i)
		
		


func _on_button_pressed() -> void:
	start_round()

func ai_turn() -> void:
	


	var ai_poke = Global.turn_order[Global.turn]
	var ai_move = ai_poke.moves[randi()%4]
	var text: String = Global.turn_order[Global.turn].pokemon_name + " played " + ai_move
	print(text)
	game_state.text = text	
	ai_poke.play_turn(ai_move)
	
	#await turn finishing
	await Global.end_turn
	transition_turn()

func transition_turn() -> void:
	
	await get_tree().create_timer(2).timeout
	print(Global.turn_order[Global.turn].name)
	Global.turn += 1
	if Global.turn == 4:
		end_round()
		return
	
	if Global.turn_order[Global.turn] == Global.current_pokemon:
		player_turn()
	else:
		ai_turn()
	

func player_turn():
	print("Player played a turn")
	game_state.text = "Player's turn"
	moves.visible = true
	button.release_focus()
	moves.move_1.grab_focus()
	#display move menu
	#wait for move menu
	await Global.end_turn
	moves.visible = false
	transition_turn()


func end_round() -> void:
	print("End round")
	# calculate score
	# calculate order priority
	# increment round counter
	
	# reset the state
	#remove everything in total_pokemon
	for child in total_pokemon.get_children():
		total_pokemon.remove_child(child)
	Global.turn = 0
	Global.turn_order.shuffle()
	# call next round
	await get_tree().create_timer(4).timeout
	if round == 2:
		game_state.text = "GAMEOVER " + "you have " + str(Global.current_pokemon.total_appeal) + " total appeal."
	else:
		start_round()
	
	pass
