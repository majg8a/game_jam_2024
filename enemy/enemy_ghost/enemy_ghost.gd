class_name enemy_ghost extends enemy

func _init():
	super._init()
	self.size = Vector2(15,15)
	self.reactionTimeSec = 3
	self.speed = Vector2(20,20)
	
	var newSkill = Melee.new()
	newSkill.damage = 5
	self.currentSkills.push_back(newSkill)
#	self.get_parent().get_parent().get_parent().add_child(newSkill)
	
	behaviors = {
		BEHAVIOR.IDLE: func ():
			self.walkInstance.random(),
		BEHAVIOR.AGGRESSIVE: func ():
			await self.walkInstance.follow()
#				self.animations_attacks[self.currentDirection].call()
#				await get_tree().create_timer(reactionTimeSec * 2).timeout
#				self.remove_child(skill)
	}
