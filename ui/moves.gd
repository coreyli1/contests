extends Control

var moves_added : bool = false
var moves : Array[String]
@onready var moves_group: GridContainer = $MovesGroup
@onready var move_1: Button = $"MovesGroup/Move 1"
@onready var move_2: Button = $"MovesGroup/Move 2"
@onready var move_3: Button = $"MovesGroup/Move 3"
@onready var move_4: Button = $"MovesGroup/Move 4"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if visible == true:
		moves.append_array(Global.current_pokemon.moves)
		var count = 0
		for m in moves_group.get_children():
			print(m)
			print(moves[count])
			m.text = moves[count]
			count+=1	
		
	
	move_1.pressed.connect(button_pressed.bind(0))
	move_2.pressed.connect(button_pressed.bind(1))
	move_3.pressed.connect(button_pressed.bind(2))
	move_4.pressed.connect(button_pressed.bind(3))



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	pass

func button_pressed(m: int):
	print(moves[m])
	Global.current_move = moves[m]
	Global.current_pokemon.generate_hearts(Global.current_move)
	print(Global.move_data[Global.current_move]["appeal"])
