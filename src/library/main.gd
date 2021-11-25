extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal morock

# Called when the node enters the scene tree for the first time.
func _ready():
	$OptionButton.add_item(" Newest", -1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_mouse_entered():
	$TextureButton/AnimationPlayer.play("morock_hover")


func _on_TextureButton_mouse_exited():
	$TextureButton/AnimationPlayer.play_backwards("morock_hover")


func _on_TextureButton_pressed():
	emit_signal("morock")
