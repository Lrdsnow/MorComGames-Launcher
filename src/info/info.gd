extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if usr.usr != "none":
		$sc/vc/s1/info.text = "   " + global.version + " For " + OS.get_name() + "_x64"
		$sc/vc/s2/usr.text = "   " + "Username: " + usr.usrs.username
	else:
		$sc/vc/spacer1.text = ""
		$sc/vc/s2.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_so_pressed():
	usr.so()
	get_tree().quit()
