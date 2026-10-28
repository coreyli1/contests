extends Node2D

var enemy_pokemon
var enemy_current_move
var state: String
var round: int = 0

@onready var game_state: Label = $GameState
@onready var total_pokemon: Node2D = $TotalPokemon
@onready var moves: Control = %Moves
@onready var round_label: Label = $Round



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generate_pokemon()
	pass

	#initiate turn structure
	
	#generate_pokemon()	
	#for i in range(4):
		#await get_tree().create_timer(3.0).timeout
		#if Global.turn_order[i].current:
			#print("Player's Turn")
			#await $"Move UI/Apply Moves".button_up
			#pass
		#else:
			#print("Player " + str(i+1) + "'s turn" )
			#await play_ai_turn(Global.turn_order[i], randi()%4)

func start_round():
	#change the turn order based on specific requirements
	#random for now
	#rerender the scene
	round += 1
	round_label.text = "Round " + str(round)
	
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
		poke.position.y += ypos
		total_pokemon.add_child(poke)
		poke.set_variables(i)
		ypos+= 50
		


func _on_button_pressed() -> void:
	start_round()

func ai_turn() -> void:
	print(Global.turn_order[Global.turn].pokemon_name, " played")


	var ai_poke = Global.turn_order[Global.turn]
	var ai_move = ai_poke.moves[randi()%4]
	var text: String = Global.turn_order[Global.turn].pokemon_name + " played " + ai_move
	game_state.text = text	
	ai_poke.play_turn(ai_move)
	
	#await turn finishing
	await Global.end_turn
	transition_turn()

func transition_turn() -> void:
	print(Global.turn)
	print(Global.turn_order[Global.turn])
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
	Global.turn = 0
	# call next round
	await get_tree().create_timer(4).timeout
	if round == 2:
		game_state.text = "GAMEOVER " + "you have " + str(Global.current_pokemon.total_appeal) + " total appeal."
	else:
		start_round()
	
	pass
