extends CharacterBody2D

var speed = 500
var can_shoot: bool = true
var can_grenade: bool = true

func _process(_delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	move_and_slide()
	shoot()
	grenade()
	interact()

func shoot():
	if Input.is_action_pressed("shoot") and can_shoot:
		print("BANG!")
		can_shoot = false
		$ShootTimer.start()

func grenade():
	if Input.is_action_pressed("grenade") and can_grenade:
		print("GRENADE!")
		can_grenade = false
		$GrenadeTimer.start()

func interact():
	if Input.is_action_just_pressed("interact"):
		print("Nothing's here.")

func _on_shoot_timer_timeout():
	can_shoot = true

func _on_grenade_timer_timeout():
	can_grenade = true
