extends Area2D

@export var interactor: Node2D
@export var interactionAction: StringName = "interact"
@export var indicatorScene: PackedScene
@export var indicatorYOffset: float = -20.0

var selectedInteractable: Interactable :
	set(value):
		if (selectedInteractable == value):
			return
		
		selectedInteractable = value
		
		if (selectedInteractable == null):
			interactionIndicator.free()
			return
		
		_addIndicatorToInteractable(selectedInteractable)

	
var nearbyInteractables: Array[Interactable]
var interactionIndicator: Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	area_entered.connect(_onAreaEntered)
	area_exited.connect(_onAreaExited)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_setSelectedInteractableToClosest()

func _input(event: InputEvent):
	if (event.is_action_pressed(interactionAction)):
		if (selectedInteractable != null):
			selectedInteractable.interact(interactor)

func _onAreaEntered(area: Area2D):
	if (area is Interactable):
		nearbyInteractables.push_back(area)
		
		if (selectedInteractable == null):
			selectedInteractable = nearbyInteractables[0]

func _onAreaExited(area: Area2D):
	if (area is Interactable):
		nearbyInteractables.erase(area)
		
		selectedInteractable.stopInteraction(interactor)
		
		if (nearbyInteractables.size() > 0):
			selectedInteractable = nearbyInteractables[0]
		else:
			selectedInteractable = null

func _addIndicatorToInteractable(interactable: Interactable):
	if (interactionIndicator == null):
		interactionIndicator = indicatorScene.instantiate()
		interactable.add_child(interactionIndicator)
	else:
		interactionIndicator.reparent(interactable)
	
	interactionIndicator.global_position = Vector2(
		interactable.global_position.x,
		interactable.global_position.y + indicatorYOffset
	)

func _setSelectedInteractableToClosest():
	if (nearbyInteractables.size() > 0):
		var closestDistance: float = INF
		var closestInteractable: Interactable
		for interactable in nearbyInteractables:
			var distanceToInteractable = interactor.global_position.distance_to(interactable.global_position)
			
			if(distanceToInteractable < closestDistance):
				closestDistance = distanceToInteractable
				closestInteractable = interactable
		
		selectedInteractable = closestInteractable
