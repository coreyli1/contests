class_name Pokemon extends Node2D


@export var pokemon_name: String = "Pokemon"
@export var attribute: String = "CUTE"
@export var moves: Array[move]

@onready var poke_name: Label = %PokeName
@onready var moves_group: GridContainer = $Control/MovesGroup
@onready var move_1: Button = $"Control/MovesGroup/Move 1"
@onready var move_2: Button = $"Control/MovesGroup/Move 2"
@onready var move_3: Button = $"Control/MovesGroup/Move 3"
@onready var move_4: Button = $"Control/MovesGroup/Move 4"




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#set label to be the pokemon_name
	poke_name.text = pokemon_name
	
	#get moves and add it to each button
	var count = 0
	for m in moves_group.get_children():
		print(m)
		print(moves[count])
		m.text = moves[count].name
		count+=1		
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func display_moves() -> void:
	moves_group.visible = true
	
func _on_move_1_pressed() -> void:
	Global.current_move = moves[0]
func _on_move_2_pressed() -> void:
	Global.current_move = moves[1]
func _on_move_3_pressed() -> void:
	Global.current_move = moves[2]
func _on_move_4_pressed() -> void:
	Global.current_move = moves[3]
