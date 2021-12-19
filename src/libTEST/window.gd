extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


static func delete_children(node):
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()
