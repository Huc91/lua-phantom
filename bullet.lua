--! file: rectangle.lua
Bullet = Object:extend()
function Bullet.new(self, start, direction)
    self.start = start
    self.direction = direction
    self.speed = 700
    self.height = 0
    self.width = 32
    self.realX = 0
    self.realY = 0
end

function Bullet.update(self, dt)
    --! logic 
    if self.direction == 'right' then
        self.realX = self.start.x
        self.realY = self.start.y
        self.height = 300
        self.width = 32
    elseif self.random == 'left' then
        self.realX = 0
        self.realY = self.start.y
        self.height = 300
        self.width = 32       
    elseif self.random == 'up' then
        self.realX = self.start.x
        self.realY = self.start.y
        self.height = 300
        self.width = 32       
    elseif self.random == 'down' then
        self.realX = self.start.x
        self.realY = self.start.y
        self.height = 300
        self.width = 32         
    end    
end

function Bullet.draw(self)
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", self.realX, self.realY, self.height, self.width )
end
