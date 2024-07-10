extends Button

@export var playerData: PlayerData
@export var amount = 5

func _ready():
	pressed.connect(_onPressed)

func _onPressed():
	playerData.inventory.money += amount 
