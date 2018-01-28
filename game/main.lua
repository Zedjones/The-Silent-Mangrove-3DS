class = require 'lib.middleclass'
require 'classes.entity'
require 'classes.trabbit'

function love.draw()
	object = {}
	player = trabbit:new(0, 0)
	love.graphics.setScreen('top')
	love.graphics.print(player:getName(), 100, 100)
end
