class = require 'lib.middleclass'
require 'classes.entity'
require 'classes.trabbit'
require 'classes.entities.chest'
require 'classes.entities.door'
require 'classes.entities.heart'

function love.load()
	player = trabbit:new(0, 0)
	chest_test = chest:new(0, 0)
end

function love.draw()
	love.graphics.setScreen('top')
	love.graphics.print(player:getName(), 100, 100)
	love.graphics.setScreen('bottom')
	love.graphics.print(tostring(chest_test:isInvincible()), 100, 100)
end
