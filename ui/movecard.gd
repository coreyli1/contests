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

@onready var h_1: TextureRect = %h1
@onready var h_2: TextureRect = %h2
@onready var h_3: TextureRect = %h3
@onready var h_4: TextureRect = %h4
@onready var h_5: TextureRect = %h5
@onready var h_6: TextureRect = %h6
@onready var h_7: TextureRect = %h7
@onready var h_8: TextureRect = %h8

@onready var j_1: TextureRect = %j1
@onready var j_2: TextureRect = %j2
@onready var j_3: TextureRect = %j3
@onready var j_4: TextureRect = %j4
@onready var j_5: TextureRect = %j5
@onready var j_6: TextureRect = %j6
@onready var j_7: TextureRect = %j7
@onready var j_8: TextureRect = %j8


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func set_labels(mn: String, t: int, a: int, j: int, d: String)->void:
	label_move_name.text = mn
	label_type.text = set_type(t)
	add_appeal(a)
	add_jam(j)
	label_description.text = d

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
	
func add_appeal(a:int) -> void:
	var h_array = [h_1,h_2,h_3,h_4,h_5,h_6,h_7,h_8]
	for i in a:
		h_array[i].texture = preload("uid://dgaakweof3oam")
		pass
	
func add_jam(j:int) -> void:
	var h_array = [j_1,j_2,j_3,j_4,j_5,j_6,j_7,j_8]
	for i in j:
		h_array[i].texture = preload("uid://dnkr4p4b1owbj")
		pass
