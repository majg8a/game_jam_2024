class_name character extends entity

enum STATE {ALIVE, DEAD}

signal maxLifeSignal(life:int)
var currentMaxLife = 10

signal lifeSignal(life: int)
var currentLife: int = currentMaxLife

signal stateSignal(state: STATE)
var currentState = STATE.ALIVE

signal skillsSignals(skills: Array)
var currentSkills: Array = []

func _init():
	super._init()
	var onStateChange: Callable = func (state):
		currentState = state
	stateSignal.connect(onStateChange)

	
	var onMaxLifeChange: Callable = func (life):
		currentMaxLife = life
	maxLifeSignal.connect(onMaxLifeChange)
	
	var addLife: Callable  = func (amount: int):
		currentLife = clamp(amount, 0, currentMaxLife)
		if currentLife == 0 && STATE.ALIVE == currentState:
			stateSignal.emit(STATE.DEAD)
	lifeSignal.connect(addLife)

func _physics_process(delta):
	if currentState == STATE.ALIVE:
		behavior()

func behavior():
	pass
