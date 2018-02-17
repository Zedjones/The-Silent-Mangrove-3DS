trabbit = class("trabbit", entity)

local turtleMovementStates = {{}}

function trabbit:init(x, y)
	entity.init(self, x, y)

	self.width = 38
	self.length = 30
end

function trabbit:draw()
	if love.keyboard.isDown("cpaddown") or love.keyboard.isDown("down") then
		self.y = self.y + 1	
	end
	if love.keyboard.isDown("cpadup") or love.keyboard.isDown("up") then 
		self.y = self.y - 1
	end
	if love.keyboard.isDown("cpadright") or love.keyboard.isDown("right") then 
		self.x = self.x + 1
		if self.isFlipped == true then 
			self.x = self.x - self.width 
		end
		self.isFlipped = false
	end
	if love.keyboard.isDown("cpadleft") or love.keyboard.isDown("left") then 
		self.x = self.x - 1
		if self.isFlipped == false then 
			self.x = self.x + self.width
		end
		self.isFlipped = true 
	end

	if self.isFlipped == false then 
		entity.draw(self)
	else 
		love.graphics.draw(self.image, self.x, self.y, rotation, -1, 1)
	end
	
end
