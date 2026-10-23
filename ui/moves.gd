extends Control

var moves_added : bool = false
var moves : Array[String]
@onready var moves_group: GridContainer = $MovesGroup

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not moves_added and visible == true:
		moves.append_array(Global.current_pokemon.moves)
		var count = 0
		for m in moves_group.get_children():
			print(m)
			print(moves)
			print(moves[count])
			m.text = moves[count]
			count+=1	
		moves_added = true
	pass
