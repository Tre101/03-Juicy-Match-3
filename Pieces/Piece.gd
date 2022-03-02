extends Node2D

export (String) var color
var is_matched
var is_counted
var selected = false
var target_position = Vector2.ZERO
var default_modulate = Color(1,1,1,1)
var highlight = Color(1,0.8,0,1)

var fall_speed = 1
var move_speed = 1

var dying = false

func _ready():
	randomize()

func _physics_process(_delta):
	if dying and not $Tween.is_active():
		queue_free()
	if not dying and target_position != Vector2.ZERO and not $Moving.is_active() and target_position != position:
		$Moving.interpolate_property(self, "position", position, target_position, move_speed, Tween.TRANS_BOUNCE, Tween.EASE_OUT)
		$Moving.start()
	if selected:
		$Selected.emitting = true
		$Select.show()
		z_index = 10
	else:
		$Selected.emitting = false
		$Select.hide()
		z_index = 1
		

func move_piece(change):
	target_position = position + change
	
func move_piece_to(change):
	position = target_position
	
func die():
	dying = true
	var target_color = $Sprite.modulate
	target_color.s = 1
	target_color.h = randf()
	target_color.a = .25
	var fall_duration = randf()*fall_speed + 1
	var rotate_amount = (randi() % 1440) - 720
	
	var target_pos = position
	target_pos.y = 1100
	$Tween.interpolate_property(self, "position", position, target_pos, fall_duration, Tween.TRANS_CUBIC, Tween.EASE_IN)
	$Tween.start()
	$Tween.interpolate_property($Sprite, "modulate", $Sprite.modulate, target_color, fall_duration-.25, Tween.TRANS_EXPO, Tween.EASE_IN)
	$Tween.start()
	$Tween.interpolate_property(self, "rotation_degrees", rotation_degrees, rotate_amount, fall_duration-.25, Tween.TRANS_QUINT, Tween.EASE_IN)
	$Tween.start()
	
	if color == "Elephant":
		get_node("/root/Game/Elephant").playing = true
	if color == "Hippo":
		get_node("/root/Game/Hippo").playing = true
	if color == "Panda":
		get_node("/root/Game/Panda").playing = true
	if color == "Parrot":
		get_node("/root/Game/Parrot").playing = true
	if color == "Penguin":
		get_node("/root/Game/Penguin").playing = true
	if color == "Pig":
		get_node("/root/Game/Pig").playing = true
	if color == "Rabbit":
		get_node("/root/Game/Rabbit").playing = true
	if color == "Snake":
		get_node("/root/Game/Snake").playing = true
	