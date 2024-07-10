extends Label

@export var playerData: PlayerData

func _ready():
	playerData.inventoryChanged.connect(_onPlayerDataInventoryChanged)

func _onPlayerDataInventoryChanged(newInventory: Inventory, oldInventory: Inventory):
	if (oldInventory != null):
		oldInventory.moneyChanged.disconnect(_playerInventoryMoneyChanged)
	text = "Money: " + str(newInventory.money)
	
	newInventory.moneyChanged.connect(_playerInventoryMoneyChanged)

func _playerInventoryMoneyChanged(new: int, _old: int):
	text = "Money: " + str(new)
