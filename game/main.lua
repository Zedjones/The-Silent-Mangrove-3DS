class = require 'lib.middleclass'
util = require 'lib.util'
require 'lib.physics'
require 'lib.collisions'

require 'classes.entity'
require 'classes.trabbit'
require 'classes.entities.chest'
require 'classes.entities.door'

--[[
-- Love2D initialization function to set up data needed to start the game 
--]]
function love.load() 
	--get start time in seconds 
	start = math.floor(love.timer.getTime())
	--load the spritesheet
	spriteSheet = love.graphics.newImage("graphics/SpriteSheet01.png")
	--create the two doors, as well as setting door images
	door_test1 = door:new(10, 10)
	door_test1:setImage(love.graphics.newImage("graphics/door.png"))
	door_test2 = door:new(20, 10)
	door_test2:setImage(love.graphics.newImage("graphics/door.png"))
	chest_test = chest:new(90, 50) 
	chest_test:setImage(spriteSheet)
	chest_test:setSprites()
	background = love.graphics.newImage("graphics/Background.png")
	background_quad = love.graphics.newQuad(0, 0, 400, 240)
	--load the trabbit, set the image to sprite sheet, and load the sprites
	trabbit_test = trabbit:new(200, 200)
	trabbit_test:setImage(spriteSheet)
	trabbit_test:setSprites()
	--keep array to hold the objects
	objects = {}
	objects["door1"] = door_test1
	objects["door2"] = door_test2
	objects["trabbit"] = trabbit_test
	objects["chest"] = chest_test
end 

--[[
-- Love2D function used for drawing images and text to the screen
-- Called after love.update()
--]]
function love.draw()
	--set up top screen
	love.graphics.clear()
	love.graphics.setScreen('top')
	--love.graphics.setColor(0, 0, 200)
	love.graphics.draw(background, background_quad, 0, 0) 
	love.graphics.setColor(255, 255, 255)
	--call draw methods for each object 
	objects["door1"]:draw()
	objects["door2"]:draw()
	objects["chest"]:draw()
	objects["trabbit"]:draw()
	--test whether or not A is down and whether or not 
	--there is a collision between the trabbit and the door
	if testDown then 
		love.graphics.print("A is down", 100, 200, 100)
	else
		if collision then 
			love.graphics.print("Collision", 100, 200, 100)  
		else
			love.graphics.print("No collision", 100, 200, 100)
		end
	end
	--draw some debugging info 
	love.graphics.setColor(255, 255, 255)
	love.graphics.setScreen('bottom')
	love.graphics.print(math.floor(x) .. " " .. math.floor(y) .. " " .. width .. " " .. length, 100, 10)
	love.graphics.print(math.floor(tx) .. " " .. math.floor(ty) .. " " .. twidth .. " " .. tlength, 100, 30)
end

--[[
-- Love2D function used for any update logic needed before the next draw 
--]]
function love.update(dt)
	objects["trabbit"]:update(dt)
	objects["chest"]:update()
	--get some debug info on positions and dimensions  
	x, y = objects["door2"]:getPosition()
	width, length = objects["door2"]:getDimensions()
	tx, ty = objects["trabbit"]:getPosition() 
	twidth, tlength = objects["trabbit"]:getDimensions()
	--test whether or not door1 and trabbit are colliding 
	collision = areColliding(objects["door1"], objects["trabbit"])
	--test whether or not A is down and call the trabbit update method 
	testDown = love.keyboard.isDown("a")
end
