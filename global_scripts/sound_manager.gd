extends Node

const WORM_WALK = "W_WALK"
const WORM_ATK = "W_ATK"
const WORM_DIE = "W_DIE"

const GHOST_WALK = "G_WALK"
const GHOST_ATK = "G_ATK"
const GHOST_DIE = "G_DIE"

const HAM_WALK = "H_WALK"
const HAM_ATK = "H_ATK"
const HAM_DIE = "H_DIE"

var SOUNDS = {
	WORM_WALK: preload("res://assets/sounds/worm_sounds_wav/wormwalk.wav"),
	WORM_ATK : preload("res://assets/sounds/worm_sounds_wav/wormatk.wav"),
	WORM_DIE: preload("res://assets/sounds/worm_sounds_wav/wormdie.wav"),
	GHOST_WALK: preload("res://assets/sounds/ghost_sounds_wav/ghostwalk.wav"),
	GHOST_ATK: preload("res://assets/sounds/ghost_sounds_wav/ghostatk.wav"),
	GHOST_DIE: preload("res://assets/sounds/ghost_sounds_wav/ghostdie.wav"),
	HAM_WALK:preload("res://assets/sounds/ham_sounds_wav/hamwalk.wav"),
	HAM_ATK: preload("res://assets/sounds/ham_sounds_wav/hamatk.wav"),
	HAM_DIE: preload("res://assets/sounds/ham_sounds_wav/hamdie.wav"),
}


func play_clip(player: AudioStreamPlayer2D, clip_key: String):
	if SOUNDS.has(clip_key) == false:
		return
	player.stream = SOUNDS[clip_key]
	player.play()
