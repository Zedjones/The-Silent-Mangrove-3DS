door = class("door", entity)

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
