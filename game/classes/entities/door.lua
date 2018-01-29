door = class("door", entity)

local door_image

function door:init(x, y)
	entity.init(self, x, y)
	
	self.isOpen = false
	self.nextArea = nil

	self.length = 18
	self.width = 8
end

function door:setNextArea(area)
	self.nextArea = area
end

function door:draw()
	local collision 
	love.graphics.draw(door_image, self.x, self.y)
end

function door:setImage(image)
	door_image = image 
end

function door:getImage()
	return door_image
end
