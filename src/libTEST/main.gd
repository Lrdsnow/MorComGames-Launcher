extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var la = 1
var cr = 1
var udscns = 0

signal morock

# Called when the node enters the scene tree for the first time.
func _ready():
	if usr.usrs.username == "guest":
		$bar/Account.hide()
		$bar/ag.hide()
	$usr/sort.add_item(" Newest", -1)
	load_scene()

var crs = preload("res://src/library/libmain.tscn")

func load_scene():
	var usr_instance = crs.instance()
	$usr/window.add_child(usr_instance)
	if cr == 1:
		$usr/window/lib/sc/vc/s1.connect("morock", self, "_on_morock")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_morock():
	cr = 2
	$usr/window.delete_children($usr/window)
	crs = preload("res://src/morock/libmorock.tscn")
	load_scene()


func _on_TextureButton_mouse_entered():
	$TextureButton/AnimationPlayer.play("morock_hover")


func _on_TextureButton_mouse_exited():
	$TextureButton/AnimationPlayer.play_backwards("morock_hover")


func _on_TextureButton_pressed():
	emit_signal("morock")


func _on_morock_pressed():
	_on_morock()
