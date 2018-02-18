chest = class("chest", entity)

--[[
-- Initialize the chest and any chest specific data 
--]]
function chest:init(x, y)
	--call the entity init and set it to invincible 
	entity.init(self, x, y)
	self.invincible = true

	self.isOpen = false 
	self.states = {}
end

function chest:setSprites()
	self.states["closed"] = love.graphics.newQuad(0, 96, 20, 16)
	self.states["open"] = love.graphics.newQuad(21, 96, 20, 16) 
end 

function chest:draw()
	if self.isOpen then 
		love.graphics.draw(self.image, self.states["open"], self.x, self.y)
	else 
		love.graphics.draw(self.image, self.states["closed"], self.x, self.y)
	end
end

function chest:open()
	self.isOpen = true
end					
