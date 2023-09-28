extends CanvasLayer

signal start_game

# Called when the node enters the scene tree for the first time.
func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func show_game_over():
	show_message("Fuck you, Tony")
	# Wait until the MessageTimer has counted down.
	await $MessageTimer.timeout

	$Message.text = "FUCK YOU AGAIN!"
	$Message.show()
	# Make a one-shot timer and wait for it to finish.
	await get_tree().create_timer(1).timeout
	$StartButton.show()

func update_score(score):
	$ScoreLabel.text = str(score)
	
func update_lives(lives):
	$Lives.text = str(lives)+' limbs left'
	
func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()

func _on_message_timer_timeout():
	$Message.hide()
