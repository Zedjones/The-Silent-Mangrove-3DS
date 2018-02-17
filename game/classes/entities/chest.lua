chest = class("chest", entity)

--[[
-- Initialize the chest and any chest specific data 
--]]
function chest:init(x, y)
	--call the entity init and set it to invincible 
	entity.init(self, x, y)
	self.invincible = true
end

