extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal si

# Called when the node enters the scene tree for the first time.
func _ready():
	$cgt.mouse_filter = Control.MOUSE_FILTER_IGNORE
	$cgt/gamertag.mouse_filter = Control.MOUSE_FILTER_IGNORE
	$cgt/gamertag/gamertag.mouse_filter = Control.MOUSE_FILTER_IGNORE
	$cgt/confirm.mouse_filter = Control.MOUSE_FILTER_IGNORE
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_login_pressed():
	$si/in.show()
	$si/password/password.text = ""


func _on_guest_pressed():
	$ani.play("tocgt")
	$cgt.mouse_filter = Control.MOUSE_FILTER_STOP
	$cgt/gamertag.mouse_filter = Control.MOUSE_FILTER_STOP
	$cgt/gamertag/gamertag.mouse_filter = Control.MOUSE_FILTER_STOP
	$cgt/confirm.mouse_filter = Control.MOUSE_FILTER_STOP


func _on_confirm_pressed():
	usr.usrs.gamertag = $cgt/gamertag/gamertag.text
	usr.usrs.username = "guest"
	usr.usrs.email = "none"
	usr.save()
	emit_signal("si")


func _on_gamertag_text_entered(new_text):
	_on_confirm_pressed()


func _on_password_text_entered(new_text):
	_on_login_pressed()
