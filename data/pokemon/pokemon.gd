class_name Pokemon extends Node2D


var pokemon_name: String = "Pokemon"
var attribute: String = "CUTE"
var moves: Array[String]
var current: bool = false
var total_appeal: int
var turn_order: int
var current_appeal: int
var current_jam: int
var previous_move: String

var nervous: bool = false
var avoid: bool = false
var oblivious: bool = false
var conscious: bool = false

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

		
		
func play_turn(m: String) -> void:
	var status = Global.move_data[m]["status"]	
	current_appeal = Global.move_data[m]["appeal"]
	current_jam = Global.move_data[m]["jam"]

	match_status(status)
	
	
	
	if current_jam >0:
		apply_jam(current_jam)
	
	
	
	# if you use the same move twice in a row unless its a special move, then you lose appeal
	if m == previous_move:
		print(pokemon_name, " used the same move twice")
		if current_appeal < 2:
			current_appeal = 0
		else:
			current_appeal -= 2
	
	await generate_hearts(current_appeal)
	total_appeal += current_appeal
	
	
	
	
	
	
	previous_move = m
	
	Global.end_turn.emit()
func generate_hearts(appeal: int) -> void:
	
	if appeal == 0:
		await get_tree().create_timer(.4).timeout
		pass
	else:
		var xpos = 0
		for i in appeal:
			var heart = Sprite2D.new()
			heart.apply_scale(Vector2(.1,.1))
			heart.texture = preload("uid://bjb6kjsv4qmye")
			heart.position.x += xpos

			xpos += 50
			await get_tree().create_timer(.4).timeout
			hearts.add_child(heart)

func apply_jam(jam: int)->void:
	#get previous pokemon
	var prev_poke: Pokemon
	prev_poke.current_appeal -= jam
	if Global.turn == 0:
		return
	else:
		prev_poke = Global.turn_order[Global.turn-1]
	var remove = prev_poke.hearts.get_children()
	for i in jam:
		print(prev_poke.hearts.get_children())
		if remove.size() == 0:
			break
		var to_remove = remove.pop_back()
		to_remove.queue_free()
		print(prev_poke.hearts.get_children())
	
	print("jam applied")
		
	pass

func match_status(status: String)->void:
	match status:
		"last":
			current_appeal = Status.last(self, current_appeal)	
		"copyprev":
			current_appeal = Status.copyprev(self, current_appeal)


func _on_tree_exited() -> void:
	for child in hearts.get_children():
		hearts.remove_child(child)
	pass # Replace with function body.
