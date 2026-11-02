extends Control

var moves_added : bool = false
var moves : Array[String]
@onready var moves_group: VBoxContainer = %MovesGroup
@onready var move_1: Button = %"Move 1"
@onready var move_2: Button = %"Move 2"
@onready var move_3: Button = %"Move 3"
@onready var move_4: Button = %"Move 4"


@onready var appeal: Label = %Appeal
@onready var jam: Label = %Jam
@onready var type: Label = %Type
@onready var move_qual: Label = %MoveQual

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	moves.append_array(Global.current_pokemon.moves)
	var count = 0
	for m in moves_group.get_children():
		m.text = Global.move_data[moves[count]].name
		count+=1	
		
	
	move_1.pressed.connect(button_pressed.bind(0))
	move_2.pressed.connect(button_pressed.bind(1))
	move_3.pressed.connect(button_pressed.bind(2))
	move_4.pressed.connect(button_pressed.bind(3))
	
	move_1.grab_focus.call_deferred()
	move_2.grab_focus.call_deferred()
	move_3.grab_focus.call_deferred()
	move_4.grab_focus.call_deferred()
	
	create_quant()
	create_description()
	
	move_1.focus_entered.connect(set_move_description.bind(0))
	move_2.focus_entered.connect(set_move_description.bind(1))
	move_3.focus_entered.connect(set_move_description.bind(2))
	move_4.focus_entered.connect(set_move_description.bind(3))
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	pass

func button_pressed(m: int):
	Global.current_move = moves[m]
	Global.current_pokemon.play_turn(Global.current_move)

func create_quant() -> void:
	appeal.text = "Appeal: " + str(Global.move_data[moves[0]].appeal)
	jam.text = "Jam: " + str(Global.move_data[moves[0]].jam)
	type.text =  set_type(Global.move_data[moves[0]].type)

func create_description() -> void:
	move_qual.text = Global.move_data[moves[0]].description
	print("create description")

func set_move_description(m: int) -> void:
	appeal.text = "Appeal: " + str(Global.move_data[moves[m]].appeal)
	jam.text = "Jam: " + str(Global.move_data[moves[m]].jam)
	type.text = ""+ set_type(Global.move_data[moves[m]].type)
	move_qual.text = Global.move_data[moves[m]].description	

func set_type(t: int)-> String:
	match t:
		0:
			return "Cool"
		1:
			return "Beauty"
		2:
			return "Cute"
		3:
			return "Clever"
		4:	
			return "Tough"
	return ""
