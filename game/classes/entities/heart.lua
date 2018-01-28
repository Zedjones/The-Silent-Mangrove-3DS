heart = class("heart", entity)

function heart:init(x, y)
	entity.init(self, x, y)
end

function heart:collect(player)
	player:changeLife(1)
	self:changeLife(-3)
end
