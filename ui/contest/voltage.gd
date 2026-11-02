extends VBoxContainer
@onready var applause: HBoxContainer = %Applause
var applause_array: Array[bool] = [false,false,false,false,false,false]
@onready var _1: TextureRect = %"1"
@onready var _2: TextureRect = %"2"
@onready var _3: TextureRect = %"3"
@onready var _4: TextureRect = %"4"
@onready var _5: TextureRect = %"5"
@onready var _6: TextureRect = %"6"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:

			
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_applause():
	for i in applause_array.size():
		print(i)
		print(applause_array[i])
		if applause_array[i] == false:
			match_applause(i+1).texture = preload("uid://baeb14hjxa46h")
			applause_array[i] = true
			return
			

func match_applause(i: int):
	match i:
		1:
			return _1
		2:
			return _2			
		3:
			return _3
		4:
			return _4
		5:
			return _5
		6:
			return _6
func remove_applause():
	for i in range(applause_array.size()-1,-1,-1):
		if applause_array[i] == true:
			match_applause(i+1).texture = preload("uid://cjaibvsu17ypu")
			applause_array[i] = false
			return

func check_applause() -> bool:
	for i in applause_array:
		if i:
			pass
		else:
			return false
	for i in applause_array:
		i = false
	return true
	
	
