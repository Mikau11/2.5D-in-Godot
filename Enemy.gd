extends CharacterBody3D

@export var EPosX = position.x
var wack = false
var right = false
var left = false
var AMIMOVINGYETIDONTREALLYKNOWBUTHOPEFULLYTHISHELPSAIGHTBYE = randi_range(1, 3) #Ignore the name
@export var PEnter = false
@export var t = null
@export var S = 2
@onready var P = $"../CharacterBody3D"
func _ready():
	print(AMIMOVINGYETIDONTREALLYKNOWBUTHOPEFULLYTHISHELPSAIGHTBYE)
func _physics_process(delta: float) -> void:
	#if PEnter:
		#if position.x < P.position.x:
			#position.x += S * delta
			#left = true
		#elif position.x > P.position.x:
			#position.x -= S * delta
	if AMIMOVINGYETIDONTREALLYKNOWBUTHOPEFULLYTHISHELPSAIGHTBYE == 1:
		position.x -= S * delta
	elif AMIMOVINGYETIDONTREALLYKNOWBUTHOPEFULLYTHISHELPSAIGHTBYE == 2:
		position.x += S * delta
	elif AMIMOVINGYETIDONTREALLYKNOWBUTHOPEFULLYTHISHELPSAIGHTBYE == 3:
		position.x = 0
func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		print("ENEMEYSPOTTED!")
		PEnter = true

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		print("ENEMYGONE!")
		PEnter = false


func _on_area_3d_2_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		print("HIT")
		wack = true
func _on_area_3d_2_body_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		wack = false
		print("NOHIT")
