entity = class("entity")

function entity:init(x, y)
	self.x = x
	self.y = y

	self.length = 10
	self.width = 10

	self.alive = true

	self.speaking = false

	self.health = 3

	self.momentumx = 0
	self.momentumy = 0

	self.invincible = false 

end

function entity:getName()
	return tostring(self.class)
end

function entity:isInvincible()
	return self.invincible
end

function entity:changeLife(offset)
	if self.invincible then
		return
	end
	self.health = self.health + offset 
	if self.health <= 0 then 
		self.health = 0
		self.alive = false 
	end 
end 
