door = class("door", entity)

--[[
-- Initializes data specific to the door
-- @param x - the x position to render the door at 
-- @param y - the y position to render the door at 
--]]
function door:init(x, y)
	entity.init(self, x, y)

	--whether or not the door is open 
	self.isOpen = false
	--keep track of where the door leads to 
	self.nextArea = nil

	--set the length and width of the door 
	self.length = 18
	self.width = 8

	--door is active by default 
	self.active = true

end

--[[
-- Change the curret area, should eventually make another class 
-- to handle this for us 
-- @param area - the area to change to
--]]
function door:setNextArea(area)
	self.nextArea = area
end

function door:setSprites()
	self.doorQuad = love.graphics.newQuad(0, 215, 24, 33)
end

function door:draw()
	love.graphics.draw(self.image, self.doorQuad, self.x, self.y)
end
