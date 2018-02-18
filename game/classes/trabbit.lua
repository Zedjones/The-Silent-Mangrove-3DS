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
	self.walking = {}
	self.time = 0

	self.stateEnum = {
		breathing = 0,
		walking = 1, 
		jumping = 2	
	}

	self.health = 2

	self.maxHealth = 3

	self.currState = self.stateEnum["breathing"]
	self.prevInput = {}
	self.currInput = {}
	self.wasFlipped = false
end

--[[
-- Function to handle drawing and draw logic    
--]]
function trabbit:draw()
	--if not flipped, draw the regular image
	if self.isFlipped == false then
		if self.currState == self.stateEnum["breathing"] then 
			love.graphics.draw(self.image, self.breathing[self.activeFrame], 
				math.floor(self.x), math.floor(self.y))
		elseif self.currState == self.stateEnum["walking"] then 
			love.graphics.draw(self.image, self.walking[self.activeFrame], 
				math.floor(self.x), math.floor(self.y))
		end
	--otherwise, draw the flipped image 
	else
		if self.currState == self.stateEnum["breathing"] then 
			love.graphics.draw(self.image, self.breathing[self.activeFrame], 
				math.floor(self.x), math.floor(self.y), rotation, -1, 1)
		elseif self.currState == self.stateEnum["walking"] then 
			love.graphics.draw(self.image, self.walking[self.activeFrame], 
				math.floor(self.x), math.floor(self.y), rotation, -1, 1)
		end 
	end
	--print the active frame for debugging 
	love.graphics.print(tostring(self.activeFrame), 100, 50)
	--love.graphics.print(tostring(switched_dir), 100, 70)
end

--[[
-- Function to set the sprites from the sprite sheet and set the 
-- regular active frame 
--]]
function trabbit:setSprites()
	self.breathing[1] = love.graphics.newQuad(0, 1, 35, 31)
	self.breathing[2] = love.graphics.newQuad(35, 0, 35, 32)
	self.breathing[3] = self.breathing[1]
	self.breathing[4] = love.graphics.newQuad(109, 2, 35, 30)

	self.walking[1] = love.graphics.newQuad(0, 33, 35, 32)
	self.walking[2] = love.graphics.newQuad(35, 33, 37, 32)
	self.walking[3] = self.walking[1]
	self.walking[4] = love.graphics.newQuad(109, 33, 34, 32)

	self.activeFrame = 1
end

--[[
-- Function to update the position and correct texture of the 
-- trabbit  
--]]
function trabbit:update(dt)
	self.time = self.time + dt
	if self.isFlipped ~= nil then 
		self.wasFlipped = self.isFlipped
		end
	--if self.currInput ~= nil then 
	for j in pairs(self.prevInput) do 
		self.prevInput[j] = self.currInput[j]
	end	--[[
	else 
		for j in pairs(self.prevInput) do 
			self.prevInput[j] = nil
		end
	end
	--]]
	for k in pairs(self.currInput) do 
		self.currInput[k] = nil 
	end

	--get previous position before making any changes to the position 
	self.prevX, self.prevY = self:getPosition() 
	--if down is pressed, then move trabbit down 
	if love.keyboard.isDown("cpaddown") or love.keyboard.isDown("down") then
		self.y = self.y + 1.5	
		self.currInput["down"] = true 
	end
	--if up is pressed, then move trabbit up 
	if love.keyboard.isDown("cpadup") or love.keyboard.isDown("up") then 
		self.y = self.y - 1.5
		self.currInput["up"] = true 
	end
	--if right is pressed, then move trabbit right 
	if love.keyboard.isDown("cpadright") or love.keyboard.isDown("right") then 
		self.x = self.x + 1.5
		if self.isFlipped == true then 
			self.x = self.x - self.width 
		end
		self.isFlipped = false
		self.currInput["right"] = true 
	end
	--if left is pressed, then move trabbit left 
	if love.keyboard.isDown("cpadleft") or love.keyboard.isDown("left") then 
		self.x = self.x - 1.5
		if self.isFlipped == false then 
			self.x = self.x + self.width
		end
		self.isFlipped = true 
		self.currInput["left"] = true
	end

	--only change the frame if there has been half a second elapsed 
	--since last change 
	if self.time > .5 then 
		self.time = 0 
	else 
		return 
	end
		
	--update current frame every second 
	self.activeFrame = (self.activeFrame + 1) % 4
	--logic for the different breathing frames
	if self.activeFrame == 0 then 
		self.activeFrame = 4
	end

	--if the current state is breathing then accomodate the different 
	--sprite sizes 
	if self.currState == self.stateEnum["breathing"] then 
		if self.activeFrame == 4 then 
			self.y = self.y + 1
		elseif self.activeFrame == 2 then 
			self.y = self.y - 1
		elseif self.activeFrame == 3 then 
			self.y = self.y + 1
		elseif self.activeFrame == 1 then 
			self.y = self.y - 1
		end
	end

	--keep track of whether or not we have switched from 
	--breathing to walking 
	switched_state = false 
	local switched_dir = false 
	--if there was no previous input and now we have begun to move
	--left or right, then we have switched states 
	if #self.prevInput == 0 and self.currInput["right"] ~= nil then 
		switched_state = true
	end
	if #self.prevInput == 0 and self.currInput["left"] ~= nil then 
		switched_state = true
	end
	--TODO fix this, currently not working properly 
	if self.prevInput["left"] ~= nil and self.currInput["right"] ~= nil then 
		switched_dir = true
	end
	if self.prevInput["right"] ~= nil and self.currInput["left"] ~= nil then 
		switched_dir = true
	end
	--TODO fix this, currently not working properly 
	if self.isFlipped == false and self.wasFlipped == true or 
		self.isFlipped == true and self.wasFlipped == false then 
		switched_dir = true 
	end
	
	--if the state has switched 
	if switched_state then 
		--if the new state is walking 
		if self.currState ~= self.stateEnum["walking"] then 
			self.currState = self.stateEnum["walking"]		
			--make some changes to adjust for the sprite size 
			self.y = self.y + 1
			if self.activeFrame == 2 then 
				self.y = self.y + 1
			end
			if self.activeFrame == 4 then 
				self.y = self.y - 1
			end
			self.activeFrame = 1 
		end  
	else
		--do the same for breathing 
		if self.currState ~= self.stateEnum["breathing"] then 
			self.currState = self.stateEnum["breathing"] 
			self.activeFrame = 1 
			self.y = self.y - 1
		end
	end

	--TODO fix this, currently not working properly 
	if switched_dir then 
		self.activeFrame = 1
	end
end
