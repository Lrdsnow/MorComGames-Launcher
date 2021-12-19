extends Node

const FILE_NAME = "user://info.json"

var usr = "none"

var usrs = {
	"gamertag": "guest",
	"email": "none",
	"username": "guest",
}

func save():
	var file = File.new()
	file.open(FILE_NAME, File.WRITE)
	file.store_string(to_json(usrs))
	file.close()

func load():
	var file = File.new()
	if file.file_exists(FILE_NAME):
		file.open(FILE_NAME, File.READ)
		var data = parse_json(file.get_as_text())
		file.close()
		if typeof(data) == TYPE_DICTIONARY:
			usrs = data
			usr = "pass"
		else:
			printerr("Corrupted data!")
			usr = "none"
	else:
		printerr("No saved data!")
		usr = "none"

func so():
	var file = File.new()
	if file.file_exists(FILE_NAME):
		var dir = Directory.new()
		dir.remove(FILE_NAME)
		
