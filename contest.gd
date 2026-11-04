extends Node2D

var state: String
var round: int = 0

@onready var game_state: Label = $GameState
@onready var total_pokemon: Node2D = $TotalPokemon
@onready var moves: Control = %Moves
@onready var round_label: Label = $Round
@onready var button: Button = $Button
@onready var voltage: VBoxContainer = $Voltage



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
	moves.visible = true
	moves.move_1.grab_focus()
	button.visible = false
	
	await moves.moves_applied
	moves.visible = false
	if Global.turn_order[Global.turn] == Global.current_pokemon:
		player_turn()
	else:
		ai_turn()
	#play the ai turn





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
	print("wait for ai turn to stop playing")
	await Global.end_turn
	print("ai finished turn")
	#if the move is the same as the current contest, then add an applause
	if Global.move_data[ai_move].type == Global.contest_type:
		voltage.add_applause()	
	else:
		voltage.remove_applause()
	#just add applause for testing right now
	
	if voltage.check_applause():
		await ai_poke.generate_hearts(ai_poke.current_appeal+5)
		Global.turn_order[Global.turn].total_appeal += 5
	transition_turn()

func transition_turn() -> void:
	
	await get_tree().create_timer(2).timeout

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
	Global.current_pokemon.play_turn(Global.current_move)
	await Global.end_turn

	
	if Global.move_data[Global.current_pokemon.previous_move].type == Global.contest_type:
		voltage.add_applause()	
	else:
		voltage.remove_applause()
	if voltage.check_applause():
		await Global.current_pokemon.generate_hearts(Global.current_pokemon.current_appeal+5)
		Global.turn_order[Global.turn].total_appeal += 5
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
	Global.turn_algo()
	# call next round
	await get_tree().create_timer(2).timeout
	if round == 4:
		game_state.text = str(calculate_appeal()) + " has won the game!"
	else:
		start_round()
	
	pass

func calculate_appeal():
	var appeals: Array[int]
	for poke in Global.turn_order:
		appeals.append(poke.total_appeal)
	return Global.turn_order[appeals.find(appeals.max())].pokemon_name
	
