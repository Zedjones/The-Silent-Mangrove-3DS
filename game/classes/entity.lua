entity = class("entity")

--[[
-- Function to initialize any data relating to all entities 
--]]
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

--[[
-- Function to get the name of the class
-- @return string - the name of the class 
--]]
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

--[[
-- Function to take or remove damage 
-- @param offset - the amount to change health by 
--]]
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

--[[
-- Function to set the image to use for drawing, 
-- eventually will just be a sprite sheet for everything
-- @param image - the image to use for drawing 
--]] 
function entity:setImage(image)
	self.image = image 
end

--[[
-- Function to get the image used for drawing 
-- @return image - the image used for drawing  
--]]
function entity:getImage()
	return self.image
end

--[[
-- Basic draw function that will more than likely be 
-- overridden by most entities  
--]]
function entity:draw()
	love.graphics.draw(self.image, self.x, self.y)
end
