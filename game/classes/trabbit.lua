trabbit = class("trabbit", entity)

local trabbit_image = love.graphics.newImage("graphics/SpriteSheet01.png")
local turtleMovementStates = {{}}

function trabbit:init(x, y)
	entity.init(self, x, y)
end


