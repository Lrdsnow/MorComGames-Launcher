extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var morock_installed = false
var d = false
var morock = "user://morock"
var morockexe = "%Appdata%\\mcgl\\Games\\morock\\morock.exe"
var gitver = "a1"

# Called when the node enters the scene tree for the first time.
func _ready():
	var dir = Directory.new()
	if dir.file_exists(morock):
		$play.text = "Play"
		if OS.get_name() == "OSX":
			$tplay.show()
		morock_installed = true
	else:
		$play.text = "Install"
		$tplay.hide()
		morock_installed = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if d == true:
		var percent = int($HTTPRequest.downloadedBytes*100/$HTTPRequest.bodySize)
		$load/ProgressBar.value = percent


func _on_play_pressed():
	if morock_installed == true:
		if OS.get_name() == "Windows":
			launch()
		else:
			if OS.get_name() == "OSX":
				easylaunchmac()
	else:
		if OS.get_name() == "Windows":
			installwin()
		if OS.get_name() == "OSX":
			easyinstallmac()

func launch():
	OS.execute(morockexe, [])
	get_tree().quit()

func launchmac():
	OS.execute("open", ["~/mcgl/Games/morock/Morock.app"])
	get_tree().quit()

func easylaunchmac():
	var launchfile = OS.get_executable_path().get_base_dir() + "/run.command"
	OS.execute(launchfile, [])
	get_tree().quit()



func installwin():
	var output
	var unzip_link = "https://raw.githubusercontent.com/Lrdsnow/MorComGames-Launcher/main/unzip.bat"
	var morock_location = OS.get_executable_path().get_base_dir() + "/Games/morock/"
	var morock_link = "https://github.com/Lrdsnow/morock/releases/download/" + gitver + "/morock.exe"
	#var morock_zip = OS.get_executable_path().get_base_dir() + "/Games/morock.zip"
	var morock_zip = OS.get_executable_path().get_base_dir() + "/morock.zip"
	d = true
	print("Downlading")
	#download(morock_link, morock_zip)
	OS.execute("mkdir", ["%Appdata%\\mcgl"])
	OS.execute("mkdir", ["%Appdata%\\mcgl\\Games"])
	OS.execute("mkdir", ["%Appdata%\\mcgl\\Games\\morock"])
	OS.execute("curl", ["https://raw.githubusercontent.com/Lrdsnow/morock/main/gitver", "-L", "-o", "%Appdata%\\mcgl\\gitver.txt"])
	var gitverw = []
	OS.execute("type", ["%Appdata%\\mcgl\\gitver.txt"], true, gitverw)
	gitver=gitverw
	OS.execute("curl", [morock_link, "-L", "-o", "%Appdata%\\mcgl\\Games\\morock\\morock.exe"])
	print("Downloaded!")
	d = false
	print("Creating Confirm File")
	var file = File.new()
	file.open(morock, File.WRITE)
	file.close()
	print("File Created")
	print("reloading...")
	get_tree().change_scene("res://main.tscn")

func download(url : String, target : String):
	$HTTPRequest.download_file = target # where to save the downloaded file
	$HTTPRequest.request(url) # start the download

func easyinstallmac():
	var installfile = OS.get_executable_path().get_base_dir() + "/install.command"
	OS.execute(installfile, [])
	print("Creating Confirm File")
	var file = File.new()
	file.open(morock, File.WRITE)
	file.close()
	print("File Created")
	$AnimationPlayer.play_backwards("bar")
	print("reloading...")
	get_tree().change_scene("res://main.tscn")

func launchtmac():
	var launchfile = OS.get_executable_path().get_base_dir() + "/runt.command"
	get_tree().quit() && OS.execute(launchfile, [])

func _on_tplay_pressed():
	if morock_installed == true:
		if OS.get_name() == "Windows":
			launch()
		else:
			if OS.get_name() == "OSX":
				launchtmac()
