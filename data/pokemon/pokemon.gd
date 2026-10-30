class_name Pokemon extends Node2D


var pokemon_name: String = "Pokemon"
var attribute: String = "CUTE"
var moves: Array[String]
var current: bool = false
var total_appeal: int
var turn_order: int
var current_appeal: int
var current_jam: int

@onready var poke_name: Label = %PokeName
@onready var move_used: Label = %MoveUsed
@onready var hearts: HBoxContainer = $Control/Hearts





# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_variables(turn: int) -> void:
	#set label to be the pokemon_name
	poke_name.text = pokemon_name
	turn_order = turn
	#get moves and add it to each button

	if current:
		poke_name.add_theme_color_override("font_color", Color(0.255, 0.607, 0.288, 1.0))
		pass
		
		
func play_turn(m: String) -> void:
	current_appeal = Global.move_data[m]["appeal"]
	current_jam = Global.move_data[m]["jam"]
	var status = Global.move_data[m]["status"]
	match_status(status)

	total_appeal += current_appeal
	await generate_hearts(current_appeal)
	Global.end_turn.emit()
	
func generate_hearts(appeal: int) -> void:
	
	var xpos = 0
	for i in appeal:
		var heart = Sprite2D.new()
		heart.apply_scale(Vector2(.1,.1))
		heart.texture = preload("uid://bjb6kjsv4qmye")
		heart.position.x += xpos

		xpos += 50
		await get_tree().create_timer(.2).timeout
		hearts.add_child(heart)
	
func match_status(status: String)->void:
	match status:
		"last":
			current_appeal = Status.last(self, current_appeal)	
