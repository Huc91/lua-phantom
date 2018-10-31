--! file: gui-battery.lua

GUI_Battery = Object:extend()

function GUI_Battery.new(self, x, y, energy, maxEnergy)
	self.x = x
    self.y = y
    self.value = ( 48 * energy ) / maxEnergy
    self.image = love.graphics.newImage("gui-battery.png")
end

function GUI_Battery.update(self, dt)
    self.value = ( 48 * energy ) / maxEnergy
end

function GUI_Battery.draw(self)
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(self.image, self.x, self.y)
    love.graphics.setColor(1, 1, 0)
	love.graphics.rectangle("fill", self.x + 5, self.y + 20, self.value, 24)
end
