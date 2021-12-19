extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal morock

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_morock_mouse_entered():
	$morock/AnimationPlayer.play("morock_hover")


func _on_morock_mouse_exited():
	$morock/AnimationPlayer.play_backwards("morock_hover")


func _on_morock_pressed():
	emit_signal("morock")


func _on_morock2_pressed():
	emit_signal("morock")
