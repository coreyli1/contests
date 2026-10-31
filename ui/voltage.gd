extends VBoxContainer
@onready var applause: HBoxContainer = %Applause
var applause_array: Array[Sprite2D]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_applause():
	#add sprite to 
	var to_add = Sprite2D.new()
	to_add.texture = preload("res://assets/icon.svg")
	applause.add_child(to_add)
	applause_array.append(to_add)
	pass

func remove_applause():
	applause.remove_child(applause_array[applause_array.size()-1])
	applause_array.pop_back()
