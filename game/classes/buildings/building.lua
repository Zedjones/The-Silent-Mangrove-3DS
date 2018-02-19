building = class("building")

function building:init(x, y, door)
	self.active = true 
	
	self.door = door
	self.x = x 
	self.y = y

end 

function building:getPosition()
	return self.x, self.y 
end

function building:setImage(image)
	self.image = image 
end

function building:getImage(image)
	return self.image 
end

function building:setSprite(spriteQuad)
	self.sprite = spriteQuad 
end

function building:getDoorPosition()
	return self.door:getPosition()
end
