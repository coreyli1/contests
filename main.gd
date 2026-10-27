extends Node2D

var enemy_pokemon
var enemy_current_move
var state: String

@onready var game_state: Label = $GameState
@onready var total_pokemon: Node2D = $TotalPokemon



# Called when the node enters the scene tree for the first time.
func _ready() -> void:	


	#initiate turn structure
	start_round()
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
	Global.turn_order.shuffle()	
	#rerender the scene
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
func generate_pokemon() ->void:
	var ypos = 50
	for i in Global.turn_order:
		i.position.y += ypos
		total_pokemon.add_child(i)
		i.set_variables()
		ypos+= 50
		


func _on_button_pressed() -> void:
	state = "Turn"

func ai_turn() -> void:
	print(Global.turn_order[Global.turn].pokemon_name, " played")
	#need to await a signal thats finished
	play_ai_turn(Global.turn_order[Global.turn], randi()%4)
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
	
	pass

#poke is the ai pokemon
#r is to randomly decide the move
func play_ai_turn(poke: Pokemon, r: int) -> void:
	poke.generate_hearts(poke.moves[r])

func player_turn():
	print("Player played a turn")
	#display move menu
	#wait for move menu
	await Global.end_turn
	transition_turn()


func end_round() -> void:
	print("End round")
	# calculate score
	# calculate order priority
	# increment round counter
	# call next round
	pass
