extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Get the input direction (Vector2: x = left/right, y = up/down)
	var direction := Input.get_vector("left", "right", "up", "down")   # CHANGED
	
	if direction:
		velocity = direction * SPEED   # CHANGED: set both x and y at once
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)   # CHANGED: slow down on both axes
	
	move_and_slide()
	
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "NPC":
		body.get_node("Dots").visible = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "NPC":
		body.get_node("Dots").visible = false
