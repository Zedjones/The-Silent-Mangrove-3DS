chest = class("chest", entity)

function chest:init(x, y)
	entity.init(self, x, y)
	self.invincible = true
end

