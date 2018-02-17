trabbit = class("trabbit", entity)

function trabbit:init(x, y)
	entity.init(self, x, y)

	self.width = 38
	self.length = 30

	self.walking = {}
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
		love.graphics.draw(self.image, self.activeFrame, self.x, self.y)
	else 
		love.graphics.draw(self.image, self.activeFrame, self.x, self.y, rotation, -1, 1)
	end
	
end

function trabbit:setSprites()
	self.walking[1] = love.graphics.newQuad(0, 1, 38, 30)
	--self.walking[2] = love.graphics.newQuad(35, 0, 38, 31, this.image:getDimensions())
	--self.walking[3] = self.walking[1]
	--self.walking[4] = love.graphics.newQuad(109, 2, 38, 30, this.image:getDimensions())

	self.activeFrame = self.walking[1]
end
