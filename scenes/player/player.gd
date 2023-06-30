extends CharacterBody2D

signal player_shoot(pos,dir)
signal player_grenade(pos,dir)
@export var speed: int = 500
var can_shoot: bool = true
var can_grenade: bool = true

func _process(_delta):
	# Variables
	var direction: Vector2 = Input.get_vector("left","right","up","down")
	var pos: Vector2 = $ShootStart.global_position
	var dir: Vector2 = (get_global_mouse_position() - position).normalized()
	# Movement
	velocity = direction * speed
	move_and_slide()
	# Rotation
	look_at(get_global_mouse_position())
	# Shoot
	if Input.is_action_pressed("shoot") and can_shoot:
		print("BANG!")
		can_shoot = false
		$Timers/ShootTimer.start()
		player_shoot.emit(pos,dir)
	# Grenade
	if Input.is_action_pressed("grenade") and can_grenade:
		print("GRENADE!")
		can_grenade = false
		$Timers/GrenadeTimer.start()
		player_grenade.emit(pos,dir)
	# Interact
	if Input.is_action_just_pressed("interact"):
		print("Nothing's here.")

# Timers
func _on_shoot_timer_timeout():
	can_shoot = true
func _on_grenade_timer_timeout():
	can_grenade = true
