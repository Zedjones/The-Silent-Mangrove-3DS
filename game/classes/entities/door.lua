door = class("door", entity)

function door:init(x, y)
	entity.init(self, x, y)
	
	self.isOpen = false
	self.nextArea = nil
end

function door:setNextArea(area)
	self.nextArea = area
end
