extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_morock2_mouse_entered():
	$morock2/AnimationPlayer.play("morock_hover")


func _on_morock2_mouse_exited():
	$morock2/AnimationPlayer.play_backwards("morock_hover")
