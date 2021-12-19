extends Control

var following = false
var dragging_start_position = Vector2()

var la = 1
var cr = 0
var udscns = 0
var si = true

export(String) var version

var mnuhvd = false

var crs = preload("res://src/libTEST/main.tscn")

func _ready():
	usr.usr = "none"
	ckusr()
	if si == false:
		#custom()
		global.version = version
		load_scene()

func load_scene():
	var usr_instance = crs.instance()
	$window_usr.add_child(usr_instance)
	if cr == 1:
		$window_usr/Library.connect("morock", self, "_on_morock")

func _on_TitleBar_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1:
			following = !following
			dragging_start_position = get_local_mouse_position()

func _process(_delta):
	if following:
		OS.set_window_position(OS.window_position + get_global_mouse_position() - dragging_start_position)


func _on_CloseButton_pressed():
	get_tree().quit()


func _on_MinimizeButton_pressed():
	OS.set_window_minimized(true)


func _on_Logo_mouse_entered():
	$TitleBar/Menu.hide()
	if la == 1 and $TitleBar/AnimationPlayer.is_playing() == false:
		$TitleBar/AnimationPlayer.play("LibraryTOLogo")
	if la == 2 and $TitleBar/AnimationPlayer.is_playing() == false:
		$TitleBar/AnimationPlayer.play("MoreTOLogo")
	la = 3


func _on_More_mouse_entered():
	if la == 1:
		$TitleBar/AnimationPlayer.play("LibraryTOMore")
	if la == 3:
		$TitleBar/AnimationPlayer.play_backwards("MoreTOLogo")
	la = 2


func _on_Logo_mouse_exited():
	if $TitleBar/More.is_hovered() == false and $TitleBar/Logo.is_hovered() == false:
		if la == 2:
			$TitleBar/AnimationPlayer.play_backwards("LibraryTOMore")
		if la == 3:
			$TitleBar/AnimationPlayer.play_backwards("LibraryTOLogo")
		la = 1


func _on_More_mouse_exited():
	if $TitleBar/Logo.is_hovered() == false and $TitleBar/More.is_hovered() == false:
		if la == 2:
			$TitleBar/AnimationPlayer.play_backwards("LibraryTOMore")
		if la == 3:
			$TitleBar/AnimationPlayer.play_backwards("LibraryTOLogo")
		la = 1


func _on_Home_mouse_entered():
	$TitleBar/Menu.hide()
	if la == 2:
		$TitleBar/AnimationPlayer.play_backwards("LibraryTOMore")
	if la == 3:
		$TitleBar/AnimationPlayer.play_backwards("LibraryTOLogo")
	la = 1


func _on_window_mouse_entered():
	$TitleBar/Menu.hide()
	if la == 2:
		$TitleBar/AnimationPlayer.play_backwards("LibraryTOMore")
	if la == 3:
		$TitleBar/AnimationPlayer.play_backwards("LibraryTOLogo")
	la = 1


func _on_window_usr_mouse_entered():
	if la == 2:
		$TitleBar/AnimationPlayer.play_backwards("LibraryTOMore")
	if la == 3:
		$TitleBar/AnimationPlayer.play_backwards("LibraryTOLogo")
	la = 1


func _on_window_focus_entered():
	if la == 2:
		$TitleBar/AnimationPlayer.play_backwards("LibraryTOMore")
	if la == 3:
		$TitleBar/AnimationPlayer.play_backwards("LibraryTOLogo")
	la = 1


func _on_Button_pressed():
	pass # Replace with function body.


func _on_Button_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1:
			following = !following
			dragging_start_position = get_local_mouse_position()

func _on_morock():
	cr = 2
	$window_usr.delete_children($window_usr)
	crs = preload("res://src/morock/main.tscn")
	load_scene()


func _on_Menu_focus_exited():
	if $TitleBar/Menu/Exit.grab_focus() == false:
		$TitleBar/Menu.hide()


func _on_More_pressed():
	$TitleBar/Menu.show()


func _on_More_focus_exited():
	if $TitleBar/Menu.grab_focus() == false and $TitleBar/Menu/Exit.grab_focus() == false:
		$TitleBar/Menu.hide()


func _on_Exit_focus_exited():
	if $TitleBar/Menu.grab_focus() == false:
		$TitleBar/Menu.hide()


func _on_Menu_mouse_exited():
	if $TitleBar/Menu/Exit.is_hovered() == false:
		$TitleBar/Menu.hide()
	mnuhvd = false


func _on_Exit_mouse_exited():
	if mnuhvd == false:
		$TitleBar/Menu.hide()


func _on_Menu_mouse_entered():
	mnuhvd = true


func _on_Exit_pressed():
	get_tree().quit()


func _on_Logo_pressed():
	cr = 0
	$window_usr.delete_children($window_usr)
	crs = preload("res://src/info/info.tscn")
	load_scene()


func _on_Home_pressed():
	if si != true:
		$window_usr.delete_children($window_usr)
		var crs = preload("res://src/libTEST/main.tscn")
		var usr_instance = crs.instance()
		$window_usr.add_child(usr_instance)
	else:
		$window_usr.delete_children($window_usr)
		var crs = preload("res://src/si/main.tscn")
		var usr_instance = crs.instance()
		$window_usr.add_child(usr_instance)

func custom():
	if OS.get_name() == "Windows":
		var ps1 = OS.get_executable_path().get_base_dir() + "/Assets/custom.ps1"
		var output = []
		var color = OS.execute("powershell", ["-executionpolicy", "unrestricted", ps1], true, output)
		print(output, " ", color)

func ckusr():
	usr.load()
	if usr.usr == "none":
		$TitleBar/Home/lib.text = "Sign In"
		si = true
		si()
	else:
		print("Already Signed In As ", usr.usrs.username)
		si = false

func si():
	$window_usr.delete_children($window_usr)
	var crs = preload("res://src/si/main.tscn")
	var usr_instance = crs.instance()
	$window_usr.add_child(usr_instance)
	$window_usr/si.connect("si", self, "_on_si")

func _on_si():
	$window_usr.delete_children($window_usr)
	var crs = preload("res://src/libTEST/main.tscn")
	var usr_instance = crs.instance()
	$window_usr.add_child(usr_instance)
	$window_usr/lib/bar/Account.hide()
	$TitleBar/Home/lib.text = "Library"
