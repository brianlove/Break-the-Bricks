extends Control

@export var points_notification_scene: PackedScene

@onready var label: Label = $ScoreTotals/ScoreLabel
@onready var point_awards: VBoxContainer = $Notifications/CenterContainer/PanelContainer/PointAwards

var score: int:
	set(new_score):
		score = new_score
		label.text = "Score: " + str(score)
	get:
		return score


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score = 0


func score_points(new_points: int) -> void:
	score += new_points
	var notification = points_notification_scene.instantiate()
	notification.text = str(new_points) + " points!"
	point_awards.add_child(notification)
