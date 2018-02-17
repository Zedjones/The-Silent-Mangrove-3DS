trabbit = class("trabbit", entity)

function trabbit:init(x, y)
	entity.init(self, x, y)

	self.width = 38
	self.length = 30

	self.breathing = {}
	self.activeFrame = nil
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
		love.graphics.draw(self.image, self.breathing[self.activeFrame], self.x, self.y)
	else 
		love.graphics.draw(self.image, self.breathing[self.activeFrame], self.x, self.y, rotation, -1, 1)
	end
	
end

function trabbit:setSprites()
	self.breathing[1] = love.graphics.newQuad(0, 1, 35, 32)
	self.breathing[2] = love.graphics.newQuad(35, 0, 35, 33)
	self.breathing[3] = self.breathing[1]
	self.breathing[4] = love.graphics.newQuad(109, 2, 35, 32)

	self.activeFrame = 1
end

function trabbit:update()
	self.activeFrame = ((self.activeFrame + 1) % 4) + 1
end
