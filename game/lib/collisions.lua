function areColliding(entity1, entity2)
	--b1 = entity1.y + entity1.height
	local ay2 = select(2, entity1:getPosition()) + select(2, entity1:getDimensions())
	--r1 = entity1.x + entity1.width
	local ax2 = select(1, entity1:getPosition()) + select(1, entity1:getDimensions())
	--b2 = entity2.y + entity2.height
	local by2 = select(2, entity2:getPosition()) + select(2, entity2:getDimensions())
	--r2 = entity2.x + entity2.width 
	local bx2 = select(1, entity2:getPosition()) + select(1, entity2:getDimensions())
	local ax1, ay1 = entity1:getPosition()
	local bx1, by1 = entity2:getPosition()
	if entity1:flipped() then 
		local width1 = entity1:getWidth()
		ax1 = ax1 - width1
		ax2 = ax2 - width1 
	end
	if entity2:flipped() then 
		local width2 = entity2:getWidth()
		bx1 = bx1 - width2 
		bx2 = bx2 - width2 
	end
	if ax1 < bx2 and ax2 > bx1 and ay1 < by2 and ay2 > by1 then  
		return true  
	else 
		return false
	end
end
