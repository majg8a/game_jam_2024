extends enemy

var walkInstance: walk = walk.new()
	
func behavior():
	super.behavior()
	walkInstance.random(self)
