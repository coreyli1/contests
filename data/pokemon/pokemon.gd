class_name Pokemon extends Node2D


var pokemon_name: String = "Pokemon"
var attribute: String = "CUTE"
var moves: Array[String]
var current: bool = false

@onready var poke_name: Label = %PokeName
@onready var move_used: Label = %MoveUsed
@onready var hearts: HBoxContainer = $Control/Hearts





# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	

	#set label to be the pokemon_name
	#poke_name.text = pokemon_name
	
	#get moves and add it to each button
	#var count = 0
	#for m in moves_group.get_children():
		#print(m)
		#print(moves)
		#print(moves[count])
		#m.text = moves[count]
		#count+=1		
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_variables() -> void:
	#set label to be the pokemon_name
	poke_name.text = pokemon_name
	
	#get moves and add it to each button

	if current:
		poke_name.add_theme_color_override("font_color", Color(0.255, 0.607, 0.288, 1.0))
		pass
		
		

func generate_hearts(m: String) -> void:
	
	var xpos = 0
	for i in Global.move_data[m]["appeal"]:
		var heart = Sprite2D.new()
		heart.apply_scale(Vector2(.1,.1))
		heart.texture = preload("uid://bjb6kjsv4qmye")
		heart.position.x += xpos

		xpos += 50
		await get_tree().create_timer(.2).timeout
		hearts.add_child(heart)
	
	
	#end turn for testing
	Global.end_turn.emit()
