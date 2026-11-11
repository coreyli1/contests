extends Node2D

@onready var line_name: LineEdit = %Name
@onready var appeal: LineEdit = %Appeal
@onready var jam: LineEdit = %Jam
@onready var status: LineEdit = %Status
@onready var type: LineEdit = %Type
@onready var description: LineEdit = %Description

var move_array: Array[MoveCard]
var poke_array: Array[PokemonCard]
var current_move: int = 0
var current_poke: int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_labels()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func create_labels() -> void:
	
		
	for d in Global.move_data:
	
		#var card = MoveCard.new(d, Global.move_data[d]["type"], Global.move_data[d]["appeal"], Global.move_data[d]["jam"], Global.move_data[d]["description"])
		var card = preload("res://ui/movecard.tscn").instantiate()
		move_array.append(card)
		add_child(card)


		card.set_labels(d, Global.move_data[d]["type"], Global.move_data[d]["appeal"], Global.move_data[d]["jam"], Global.move_data[d]["description"])
		card.apply_scale(Vector2(.8,.8))
		card.visible = false
	
	for p in Global.pokemon_data:
		print(Global.pokemon_data[p])
		
		var pokemon = preload("res://ui/pokemoncard.tscn").instantiate()
		poke_array.append(pokemon)
		add_child(pokemon)
		
		pokemon.set_labels(Global.pokemon_data[p]["name"],p, Global.pokemon_data[p]["moves"] )
		pokemon.position.y = 200
		pokemon.visible = false	
	move_array[current_move].visible = true	
	poke_array[current_poke].visible = true
	
func create_move(name: String, appeal: int, jam: int, status: String, type: int, description: String):
	var new_move = {}
	new_move["name"] = name
	new_move["appeal"] = appeal
	new_move["jam"] = jam
	new_move["status"] = status
	new_move["type"] = type
	new_move["description"] = description
	
	return new_move



func _on_submit_pressed() -> void:
	print(line_name.text)
	var new_move = create_move(line_name.text, int(appeal.text), int(jam.text),status.text, int(type.text), description.text)
	print(new_move)
	Global.move_data[line_name.text] = new_move
	print(Global.move_data) 
	print("move added")
	pass # Replace with function body.

func set_type(t: int)-> String:
	match t:
		0:
			return "COOL"
		1:
			return "BEAUTY"
		2:
			return "CUTE"
		3:
			return "CLEVER"
		4:	
			return "TOUGH"
	return ""


func _on_previous_pressed() -> void:
	move_array[current_move].visible = false
	if current_move == 0:
		current_move = move_array.size() - 1
	else:
		current_move -= 1
	move_array[current_move].visible = true


func _on_next_pressed() -> void:
	move_array[current_move].visible = false
	if current_move == move_array.size() - 1:
		current_move = 0
	else:
		current_move += 1
	move_array[current_move].visible = true


func _on_previous_poke_pressed() -> void:
	poke_array[current_poke].visible = false
	if current_poke == 0:
		current_poke = poke_array.size() - 1
	else:
		current_poke -= 1
	poke_array[current_poke].visible = true


func _on_next_poke_pressed() -> void:
	poke_array[current_poke].visible = false
	if current_poke == poke_array.size() - 1:
		current_poke = 0
	else:
		current_poke += 1
	poke_array[current_poke].visible = true
