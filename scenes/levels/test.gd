extends Node2D

var bullet_scene: PackedScene = preload("res://scenes/projectiles/bullet.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_player_player_shoot(pos,dir):
	var bullet = bullet_scene.instantiate() as Area2D
	bullet.position = pos
	bullet.direction = dir
	bullet.rotation_degrees = rad_to_deg(dir.angle()) + 90
	$Projectiles.add_child(bullet)

func _on_player_player_grenade(pos,dir):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = dir * grenade.speed
	$Projectiles.add_child(grenade)

func _on_entrance_big_door_entered():
	print("ENTER")
