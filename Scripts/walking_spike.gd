extends CharacterBody2D

const SPEED = 60.0
const GRAVITY = 980.0

var direction = 1
var is_active = false

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight

func _physics_process(delta: float) -> void:
	# Apply gravity so the enemy stays on the floor
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Only move after the Area2D trigger is activated
	if is_active:
		# Change direction when hitting a wall
		if ray_cast_right.is_colliding():
			direction = -1
			animated_sprite.flip_h = true
		elif ray_cast_left.is_colliding():
			direction = 1
			animated_sprite.flip_h = false

		velocity.x = direction * SPEED
	else:
		velocity.x = 0

	move_and_slide()

# Triggered only when the player enters the Area2D boundary
func _on_trigger_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and not is_active:
		is_active = true
		animated_sprite.play("WALK")
