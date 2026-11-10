extends Node2D

@onready var line_name: LineEdit = %Name
@onready var appeal: LineEdit = %Appeal
@onready var jam: LineEdit = %Jam
@onready var status: LineEdit = %Status
@onready var type: LineEdit = %Type
@onready var description: LineEdit = %Description



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_labels()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func create_labels() -> void:
	var ypos = 25
		
	for d in Global.move_data:
	
		#var card = MoveCard.new(d, Global.move_data[d]["type"], Global.move_data[d]["appeal"], Global.move_data[d]["jam"], Global.move_data[d]["description"])
		var card = preload("res://ui/movecard.tscn").instantiate()
	
		print(card)
		add_child(card)
		card.label_move_name.text = d
		card.label_type.text = set_type(Global.move_data[d]["type"])
		#card.label_appeal.text = str(Global.move_data[d]["appeal"])
		#card.label_jam.text = str(Global.move_data[d]["jam"])
		card.label_description.text = Global.move_data[d]["description"]

		card.set_labels(d, Global.move_data[d]["type"], Global.move_data[d]["appeal"], Global.move_data[d]["jam"], Global.move_data[d]["description"])
		card.position.y = ypos
		ypos+= 100

		
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
