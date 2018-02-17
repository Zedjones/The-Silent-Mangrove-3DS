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

	self.isFlipped = false

end

function entity:getName()
	return tostring(self.class)
end

function entity:isInvincible()
	return self.invincible
end

function entity:getPosition()
	return self.x, self.y
end

function entity:getDimensions()
	return self.width, self.length
end

function entity:getWidth()
	return self.width 
end

function entity:flipped()
	return self.isFlipped
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

function entity:setImage(image)
	self.image = image 
end

function entity:getImage()
	return self.image
end

function entity:draw()
	love.graphics.draw(self.image, self.x, self.y)
end
