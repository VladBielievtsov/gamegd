class_name Player
extends CharacterBody2D

@export var playerData: PlayerData
@export var inventory: Inventory

@export var SPEED: float = 135

func _ready():
	call_deferred("_updatePlayerData")

func _physics_process(_delta):
	var inputDir = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	).normalized()
	
	velocity = inputDir * SPEED
	
	move_and_slide()

func _updatePlayerData():
	playerData.player = self
	playerData.inventory = inventory
