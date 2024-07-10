extends CharacterBody2D

enum  COW_STATE { IDLE, WALK }

@export var SPEED: float = 20
@export var idelTime: float = 5
@export var walkTime: float = 2

@onready var sprite = $Sprite2D
@onready var timer = $Timer

var moveDir: Vector2 = Vector2.ZERO
var currentSatate: COW_STATE = COW_STATE.IDLE

func _ready():
	pickNewState()

func _physics_process(_delta):
	if (currentSatate == COW_STATE.WALK):
		velocity = moveDir * SPEED
		move_and_slide()

func selectNewDir():
	moveDir = Vector2(
		randf_range(-1, 1),
		randf_range(-1, 1)
	)
	
	if (moveDir.x < 0):
		sprite.flip_h = true
	elif (moveDir.x > 0):
		sprite.flip_h = false

func pickNewState():
	if (currentSatate == COW_STATE.IDLE):
		currentSatate = COW_STATE.WALK
		selectNewDir()
		timer.start(walkTime)
	elif (currentSatate == COW_STATE.WALK):
		currentSatate = COW_STATE.IDLE
		timer.start(idelTime)


func _on_timer_timeout():
	pickNewState()
