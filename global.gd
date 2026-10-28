extends Node
var current_pokemon
var current_move
var turn_order : Array[Pokemon]
var turn: int = 0

const MOVES = preload("res://data/moves/moves.json")
var move_data : Dictionary
const POKEMON = preload("res://data/pokemon/pokemon.json")

signal end_turn

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Move Data Created")
	move_data = MOVES.data

	#print("Pokemon")
	#for item in POKEMON.data:
		#print(item)
	current_pokemon = preload("res://data/pokemon/pokemon.tscn").instantiate()
	current_pokemon.pokemon_name = POKEMON.data.keys()[0]
	current_pokemon.attribute = POKEMON.data[POKEMON.data.keys()[0]]["attribute"]
	current_pokemon.moves.append_array(POKEMON.data[POKEMON.data.keys()[0]]["moves"])
	current_pokemon.current = true
	turn_order.append(current_pokemon)

	#will make it random later 
	for i in range(3):
		var to_add = preload("res://data/pokemon/pokemon.tscn").instantiate()
		to_add.pokemon_name = POKEMON.data.keys()[i+1]
		to_add.attribute = POKEMON.data[POKEMON.data.keys()[i+1]]["attribute"]
		to_add.moves.append_array(POKEMON.data[POKEMON.data.keys()[i+1]]["moves"])
		turn_order.append(to_add)
	turn_order.shuffle()
	
	# get a random seed
	# use that random seed to select random pokemon
	# use that random seed to select random moves for pokemon

	#json_to_move_resource()
	


#func json_to_move_resource() -> void:
	#for m in move_data:
		#var savepath = "res://data/moves/cute_moves/" + m + ".tres"
		#var move_res = move.new()
		#
		#move_res.name = move_data[m].name
		#move_res.appeal = move_data[m].appeal
		#move_res.description = move_data[m].description
		#move_res.jam = move_data[m].jam
		#move_res.type = move_data[m].type
		#ResourceSaver.save(move_res, savepath)




#0 Cool
#1 Beauty
#2 Cute
#3 Clever
#4 Tough
