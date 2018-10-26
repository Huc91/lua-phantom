--! file: rectangle.lua
Bullet = Object:extend()
function Bullet.new(self, start, direction)
    self.start = start
    self.direction = direction
    self.speed = 700
    self.realX = 0
    self.realY = 0
    self.height = 0
    self.width = 0   
end

function Bullet.update(self, dt)
    --! logic 
    if self.direction == 'right' then
        self.realX = self.start.x
        self.realY = self.start.y
        self.height = 300
        self.width = 32
    elseif self.direction == 'left' then
        self.realX = self.start.x - 300
        self.realY = self.start.y
        self.height = 300
        self.width = 32       
    elseif self.direction == 'up' then
        self.realX = self.start.x
        self.realY = self.start.y - 300
        self.height = 32
        self.width = 300      
    elseif self.direction == 'down' then
        self.realX = self.start.x
        self.realY = self.start.y
        self.height = 32
        self.width = 300        
    end    
end

function Bullet.draw(self)
    love.graphics.rectangle("fill", self.realX, self.realY, self.height, self.width )
end
