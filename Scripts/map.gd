extends Control
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	if SignalBus.map1 == 1:
		sprite_2d.modulate = Color(1, 1, 1)
	
func _on_right_pressed() -> void:
	audio_stream_player.play()

func _on_left_pressed() -> void:
	audio_stream_player.play()


func _on_up_pressed() -> void:
	audio_stream_player.play()


func _on_down_pressed() -> void:
	audio_stream_player.play()


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")
