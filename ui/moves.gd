extends Control

var moves_added : bool = false
var moves : Array[String]
@onready var moves_group: GridContainer = $MovesGroup
@onready var move_1: Button = $"MovesGroup/Move 1"
@onready var move_2: Button = $"MovesGroup/Move 2"
@onready var move_3: Button = $"MovesGroup/Move 3"
@onready var move_4: Button = $"MovesGroup/Move 4"

@onready var move_label_1: Label = $Container/MoveLabel1
@onready var move_label_2: Label = $Container/MoveLabel2
@onready var move_label_3: Label = $Container/MoveLabel3
@onready var move_label_4: Label = $Container/MoveLabel4


# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	moves.append_array(Global.current_pokemon.moves)
	var count = 0
	for m in moves_group.get_children():
		print(moves[count])
		m.text = Global.move_data[moves[count]].name
		count+=1	
		
	
	move_1.pressed.connect(button_pressed.bind(0))
	move_2.pressed.connect(button_pressed.bind(1))
	move_3.pressed.connect(button_pressed.bind(2))
	move_4.pressed.connect(button_pressed.bind(3))
	
	create_description()
	
	move_1.mouse_entered.connect(show_hover_text.bind(1))
	move_2.mouse_entered.connect(show_hover_text.bind(2))
	move_3.mouse_entered.connect(show_hover_text.bind(3))
	move_4.mouse_entered.connect(show_hover_text.bind(4))
	
	move_1.mouse_exited.connect(hide_hover_text.bind(1))
	move_2.mouse_exited.connect(hide_hover_text.bind(2))
	move_3.mouse_exited.connect(hide_hover_text.bind(3))
	move_4.mouse_exited.connect(hide_hover_text.bind(4))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	pass

func button_pressed(m: int):
	Global.current_move = moves[m]
	Global.current_pokemon.play_turn(Global.current_move)

func show_hover_text(i: int):
	match i:
		1:
			move_label_1.visible = true
		2:
			move_label_2.visible = true
		3:
			move_label_3.visible = true
		4:
			move_label_4.visible = true	

func hide_hover_text(i: int):
	match i:
		1:
			move_label_1.visible = false
		2:
			move_label_2.visible = false
		3:
			move_label_3.visible = false
		4:
			move_label_4.visible = false	
func create_description() -> void:
	print("create description")
	for i in moves.size():
		print(Global.move_data[moves[i]].description)

		match i+1:
			1:
				move_label_1.text = Global.move_data[moves[i]].description
			2:
				move_label_2.text = Global.move_data[moves[i]].description
			3:
				move_label_3.text = Global.move_data[moves[i]].description
			4:
				move_label_4.text = Global.move_data[moves[i]].description



	
