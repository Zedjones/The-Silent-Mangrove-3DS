class = require 'lib.middleclass'
util = require 'lib.util'
require 'classes.entity'
require 'classes.trabbit'
require 'classes.entities.chest'
require 'classes.entities.door'
require 'classes.entities.heart'
require 'lib.physics'

function love.load()
	player = trabbit:new(0, 0)
	chest_test = chest:new(0, 0)
	door_test1 = door:new(10, 10)
	door_test1:setImage(love.graphics.newImage("graphics/door.png"))
	door_test2 = door:new(20, 10)
	door_test2:setImage(love.graphics.newImage("graphics/door.png"))
	objects = {}
	objects["door1"] = door_test1
	objects["door2"] = door_test2
end 

function love.draw()
	local collision
	local x, y, width, length 
	love.graphics.setScreen('top')
	love.graphics.setColor(0, 0, 200)
	love.graphics.rectangle("fill", 0, 0, 400, 240)
	love.graphics.setColor(255, 255, 255)
	objects["door1"]:draw()
	objects["door2"]:draw()	
	x, y = objects["door1"]:getPosition()
	width, length = objects["door1"]:getDimensions()
	collisions = checkrectangle(x, y, width, length, {"door2"}, self)
	if #collisions == 0 then 
		love.graphics.print("Success! No collision", 100, 200, 100)  
	end
	love.graphics.setColor(255, 255, 255)
	love.graphics.print(player:getName(), 100, 100, 100)
	love.graphics.setScreen('bottom')
	love.graphics.print(tostring(chest_test:isInvincible()), 100, 100)
end
