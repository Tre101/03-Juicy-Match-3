extends Control

func _ready():
	$Label.text = "Thanks for Playing!!\n\nYour Level 1 Score Was: " + str(Global.level1_score) + "\n\nYou Level 2 Time Was: " + str(Global.level2_time)

func _on_Play_pressed():
	Global.score = 0
	Global.time = Global.level1_default
	Global.level = 1
	Global.level1_score = 0
	Global.level2_time = 0
	var _new_scene = get_tree().change_scene("res://Game.tscn")

func _on_Quit_pressed():
	get_tree().quit()
