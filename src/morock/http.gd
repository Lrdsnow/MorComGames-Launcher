extends HTTPRequest


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var bodySize = get_body_size()
var downloadedBytes = get_downloaded_bytes()
		
#var percent = int(downloadedBytes*100/bodySize)
#print(str(percent) + " downloaded")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
