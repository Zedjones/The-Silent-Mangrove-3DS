trabbit = class("trabbit", entity)

--[[
-- Function to initialize trabbit 
-- @param x - the x position to start the class at 
-- @param y - the y position to start the class at 
--]]
function trabbit:init(x, y)
	entity.init(self, x, y)

	self.width = 38
	self.length = 30

	self.breathing = {}
	self.prevTime = start
end

--[[
-- Function to handle drawing and draw logic    
--]]
function trabbit:draw()
	--if not flipped, draw the regular image
	if self.isFlipped == false then 
		love.graphics.draw(self.image, self.breathing[self.activeFrame], 
			math.floor(self.x), math.floor(self.y))
	--otherwise, draw the flipped image 
	else 
		love.graphics.draw(self.image, self.breathing[self.activeFrame], 
			math.floor(self.x), math.floor(self.y), rotation, -1, 1)
	end
	--print the active frame for debugging 
	love.graphics.print(tostring(self.activeFrame), 100, 50)
end

--[[
-- Function to set the sprites from the sprite sheet and set the 
-- regular active frame 
--]]
function trabbit:setSprites()
	self.breathing[1] = love.graphics.newQuad(0, 1, 35, 32)
	self.breathing[2] = love.graphics.newQuad(35, 0, 35, 33)
	self.breathing[3] = self.breathing[1]
	self.breathing[4] = love.graphics.newQuad(109, 2, 35, 32)

	self.activeFrame = 1
end

--[[
-- Function to update the position and correct texture of the 
-- trabbit  
--]]
function trabbit:update()
	--if down is pressed, then move trabbit down 
	if love.keyboard.isDown("cpaddown") or love.keyboard.isDown("down") then
		self.y = self.y + 1.5	
	end
	--if up is pressed, then move trabbit up 
	if love.keyboard.isDown("cpadup") or love.keyboard.isDown("up") then 
		self.y = self.y - 1.5
	end
	--if right is pressed, then move trabbit right 
	if love.keyboard.isDown("cpadright") or love.keyboard.isDown("right") then 
		self.x = self.x + 1.5
		if self.isFlipped == true then 
			self.x = self.x - self.width 
		end
		self.isFlipped = false
	end
	--if left is pressed, then move trabbit left 
	if love.keyboard.isDown("cpadleft") or love.keyboard.isDown("left") then 
		self.x = self.x - 1.5
		if self.isFlipped == false then 
			self.x = self.x + self.width
		end
		self.isFlipped = true 
	end
	--if time is not null, set previous time to time 
	if time ~= nil then 
		self.prevTime = time
	end
	--get current time in seconds 
	time = math.floor(love.timer.getTime())
	if time - self.prevTime == 0 then 
		return 
	end
	--update current frame every second 
	self.activeFrame = (self.activeFrame + 1) % 4
	--logic for the different breathing frames 
	if self.activeFrame == 0 then 
		self.activeFrame = 4
		self.y = self.y + 1
	elseif self.activeFrame == 2 then 
		self.y = self.y - 1
	elseif self.activeFrame == 3 then 
		self.y = self.y + 1
	elseif self.activeFrame == 1 then 
		self.y = self.y - 1
	end
end
