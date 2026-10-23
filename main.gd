extends Node2D

var enemy_pokemon
var enemy_current_move
var player_turn: bool = false


@onready var hearts: HBoxContainer = $Hearts
@onready var game_state: Label = $GameState
@onready var total_pokemon: Node2D = $TotalPokemon



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#for child in self.get_children():
		#if child.name == "Pokemon":
			#Global.current_pokemon = child
	#game_state.text = "Start"		
	generate_pokemon()
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	game_logic()

	pass


func _on_moves_pressed() -> void:
	print("display moves")
	Global.current_pokemon.display_moves()
func _on_apply_moves_pressed() -> void:
	print(Global.current_move)
	generate_hearts()
#appeal
func generate_hearts() -> void:

	var xpos = 0
	
	for h in Global.current_move.appeal:
		var heart = Sprite2D.new()
		heart.apply_scale(Vector2(.5,.5))
		heart.texture = preload("uid://ubngea14khip")
		heart.position.x += xpos
		xpos += 100
		hearts.add_child(heart)

#adds pokemon created in the global scene to the 
func generate_pokemon() ->void:
	total_pokemon.add_child(Global.current_pokemon)
	Global.current_pokemon.set_variables()
	var ypos = 50
	for i in Global.enemies:
		i.position.y += ypos
		total_pokemon.add_child(i)
		i.set_variables()
		ypos+= 50
		

	pass
func handle_gameplay() -> void:
	game_state
	pass
func game_logic() -> void:
	pass
#start out a round of gameplay
# - round start
# - display order of pokemon
# - run through order of pokemon
# - run through enemy ai of pokemon
# - display appeals/jam for each pokemon move
# - calculate the judge meter
# - run through rounds
# - finish and calculate score
