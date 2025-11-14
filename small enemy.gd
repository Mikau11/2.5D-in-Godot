extends CharacterBody3D

@onready var checkcastleft = $left
@onready var checkcastright = $right
var AMIMOVINGYETIDONTREALLYKNOWBUTHOPEFULLYTHISHELPSAIGHTBYE = randi_range(1, 2)
var S = 2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(AMIMOVINGYETIDONTREALLYKNOWBUTHOPEFULLYTHISHELPSAIGHTBYE)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	checkcast(delta)
	if AMIMOVINGYETIDONTREALLYKNOWBUTHOPEFULLYTHISHELPSAIGHTBYE == 1:
		position.x -= S * delta #left
	elif AMIMOVINGYETIDONTREALLYKNOWBUTHOPEFULLYTHISHELPSAIGHTBYE == 2:
		position.x += S * delta #right
func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		print("ENEMEYSPOTTED!")
		if AMIMOVINGYETIDONTREALLYKNOWBUTHOPEFULLYTHISHELPSAIGHTBYE == 1 and body.position.x < position.x:
			S = 5 #Speeds up if player is "spotted"
		elif AMIMOVINGYETIDONTREALLYKNOWBUTHOPEFULLYTHISHELPSAIGHTBYE == 2 and body.position.x > position.x:
			S = 5 #Speeds up if player is "spotted"

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		print("ENEMYGONE!")
		print(S)
		S = 2
		print(S)
func checkcast(delta):
		if checkcastright.is_colliding() and not checkcastleft.is_colliding():
			print("Oh")
			position.x -= S * delta
			AMIMOVINGYETIDONTREALLYKNOWBUTHOPEFULLYTHISHELPSAIGHTBYE = 1
		elif checkcastleft.is_colliding() and not checkcastright.is_colliding():
			print("FAH")
			position.x += S * delta
			AMIMOVINGYETIDONTREALLYKNOWBUTHOPEFULLYTHISHELPSAIGHTBYE = 2
