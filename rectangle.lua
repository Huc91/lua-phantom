--! file: rectangle.lua

Rectangle = Object:extend()

function Rectangle.new(self, x, y, w, h)
	self.x = x
	self.y = y
	self.width = w
	self.height = h
	self.speed = math.random(64, 100)
end

function Rectangle.update(self, dt)

end

function Rectangle.draw(self)
	love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end
