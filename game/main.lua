class = require 'lib.middleclass'
util = require 'lib.util'
require 'lib.physics'
require 'lib.collisions'

require 'classes.entity'
require 'classes.trabbit'
require 'classes.entities.chest'
require 'classes.entities.door'
require 'classes.entities.heart'

function love.load()
	spriteSheet = love.graphics.newImage("graphics/SpriteSheet01.png")
	player = trabbit:new(0, 0)
	chest_test = chest:new(0, 0)
	door_test1 = door:new(10, 10)
	door_test1:setImage(love.graphics.newImage("graphics/door.png"))
	door_test2 = door:new(20, 10)
	door_test2:setImage(love.graphics.newImage("graphics/door.png"))
	trabbit_test = trabbit:new(200, 200)
	trabbit_test:setImage(spriteSheet)
	trabbit_test:setSprites()
	objects = {}
	objects["door1"] = door_test1
	objects["door2"] = door_test2
	objects["trabbit"] = trabbit_test
end 

function love.draw()
	love.graphics.clear()
	love.graphics.setScreen('top')
	love.graphics.setColor(0, 0, 200)
	love.graphics.rectangle("fill", 0, 0, 400, 240)
	love.graphics.setColor(255, 255, 255)
	objects["door1"]:draw()
	objects["door2"]:draw()
	objects["trabbit"]:draw()
	if testDown then 
		love.graphics.print("A is down", 100, 200, 100)
	else
		if collision then 
			love.graphics.print("Collision", 100, 200, 100)  
		else
			love.graphics.print("No collision", 100, 200, 100)
		end
	end
	love.graphics.setColor(255, 255, 255)
	love.graphics.print(player:getName(), 100, 100, 100)
	love.graphics.setScreen('bottom')
	love.graphics.print(tostring(chest_test:isInvincible()), 100, 100)
	love.graphics.print(x .. " " .. y .. " " .. width .. " " .. length, 100, 10)
	love.graphics.print(tx .. " " .. ty .. " " .. twidth .. " " .. tlength, 100, 30)
end

function love.update(dt)
	x, y = objects["door2"]:getPosition()
	width, length = objects["door2"]:getDimensions()
	tx, ty = objects["trabbit"]:getPosition() 
	twidth, tlength = objects["trabbit"]:getDimensions()
	collision = areColliding(objects["door1"], objects["trabbit"])
	testDown = love.keyboard.isDown("a")
end
