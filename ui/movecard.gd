class_name MoveCard extends Node2D

@onready var label_move_name: Label = %MoveName
@onready var label_type: Label = %Type
@onready var label_appeal: Label = %Appeal
@onready var label_jam: Label = %Jam
@onready var label_description: Label = %Description

var move_name
var move_type
var appeal
var jam
var desc

#func _init(mn: String, t: int, a: int, j: int, d: String) -> void:
	#move_name = mn
	#move_type = set_type(t)
	#appeal = str(a)
	#jam = str(j)
	#desc = d
	#
	
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func set_labels(mn: String, t: int, a: int, j: int, d: String)->void:
	label_move_name.text = mn
	label_type.text = set_type(t)
	label_appeal.text = str(a)
	label_jam.text = str(j)
	label_description.text = d

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
