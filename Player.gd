extends CharacterBody3D

@onready var CrouchCast = $RayCast3D
@onready var JumpSFX = $Jump
@onready var Song = $Song
@export var UnCrouch = true
@export var Crouching = false
@export var Speed = 4
@export var JV = 8
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Song.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position.z = 0

	Movement(delta)
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("SPACE") and is_on_floor():
		velocity.y = JV
		JumpSFX.play()
	move_and_slide()

func Movement(delta: float):
	if Input.is_action_pressed("A"):
		position.x -= Speed * delta
	elif Input.is_action_pressed("D"):
		position.x += Speed * delta
	
	if Input.is_action_pressed("CTRL"):
		Crouching = true
		scale.y = 0.5
		Speed = 2
		JV = 4
	elif not Input.is_action_pressed("CTRL"):
		if CrouchCast.is_colliding():
			UnCrouch = false
		else:
			UnCrouch = true
		if UnCrouch == true:
			Crouching = false
			scale.y = 1
			Speed = 4
			JV = 8
	
	if Input.is_action_pressed("SHIFT") and Crouching == false:
		Speed = 10
		JV = 10
	elif not Input.is_action_pressed("SHIFT") and Crouching == true:
		Speed = 2
		JV = 4
	else:
		Speed = 4
		JV = 8
