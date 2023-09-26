extends ColorRect
class_name Rotator

@export var rotation_speed_degree: int = 0
@export var offset: Vector2 = Vector2(20, 20)
@export var number_of_bullets: int = 12
@export var distance_from_center: int = 0
@export var horizontal_speed: int = 0
@export var bullet_speed: int = 100

const colors = [Color.YELLOW, Color.GREEN_YELLOW, Color.HOT_PINK, Color.DODGER_BLUE, Color.ORANGE_RED]
var bullet = preload("res://scenes/CircleBullet.tscn")
	
func _process(delta):
	rotation += deg_to_rad(rotation_speed_degree) * delta
	position += Vector2(horizontal_speed, 0) * delta

func _on_timer_timeout():
	var angle = 2.0 * PI / number_of_bullets
	var init_angle = rotation
	var current_color = colors[randi_range(0, colors.size() - 1)]
	for i in range(number_of_bullets):
		var b = bullet.instantiate() as CircleBullet
		b.initial_rotation_degree = angle * i + init_angle
		b.init_color = current_color
		b.speed = bullet_speed
		b.amplitude = 10.0
		b.frequency = 5
		b.offset = 0.0
	
		b.position = position + Vector2(20, 20) + Vector2(cos(angle * i + init_angle), sin(angle * i + init_angle)) * distance_from_center
		get_parent().add_child.call_deferred(b)

func _on_move_timer_timeout():
	horizontal_speed = -horizontal_speed # Replace with function body.
