class_name character extends entity

enum STATE {ALIVE, DEAD , HURT}

signal maxLifeSignal(life:int)
var currentMaxLife = 10

signal lifeSignal(life: int)
var currentLife: int = currentMaxLife

signal stateSignal(state: STATE)
var currentState = STATE.ALIVE

var animations_hurt: Dictionary = {
	Vector2.UP: func ():
		pass,
	Vector2.RIGHT: func ():
		pass,	
	Vector2.DOWN: func ():
		pass,	
	Vector2.LEFT: func ():
		pass,	
	Vector2.ZERO: func ():
		pass,	
}

var animations_attacks: Dictionary = {
	Vector2.UP: func ():
		self.animatedSprite2D.play("attack_up"),
	Vector2.RIGHT: func ():
		self.animatedSprite2D.play("attack_right"),
	Vector2.DOWN: func ():
		self.animatedSprite2D.play("attack_down"),
	Vector2.LEFT: func ():
		self.animatedSprite2D.play("attack_left"),
	Vector2.ZERO: func ():
		self.animatedSprite2D.play("idle")
}

func _init():
	super._init()
	var onStateChange: Callable = func (state): currentState = state
	stateSignal.connect(onStateChange)

	
	var onMaxLifeChange: Callable = func (life):
		currentMaxLife = life
	maxLifeSignal.connect(onMaxLifeChange)

func _ready():
	var addLife: Callable  = func (amount: int):
		currentLife = clamp(amount, 0, currentMaxLife)
		if amount < 0:
			stateSignal.emit(STATE.HURT)
			self.animations_hurt[self.currentDirection].call()
			print(currentState)
			await get_tree().create_timer(5).timeout
			print(currentState)
			stateSignal.emit(STATE.ALIVE)
		if currentLife == 0 && STATE.ALIVE == currentState || STATE.HURT == currentState:
			stateSignal.emit(STATE.DEAD)
	lifeSignal.connect(addLife)
	super._ready()
	animations_hurt = {
		Vector2.UP: func ():
			self.animatedSprite2D.play("hurt_up"),
		Vector2.RIGHT: func ():
			self.animatedSprite2D.play("hurt_right"),
		Vector2.DOWN: func ():
			self.animatedSprite2D.play("hurt_down"),
		Vector2.LEFT: func ():
			self.animatedSprite2D.play("hurt_left"),
		Vector2.ZERO: func ():
			self.animatedSprite2D.play("idle")
	}

func _physics_process(delta):
	await lifeSignal
	if currentState == STATE.ALIVE:
		behavior()

func behavior():
	pass
