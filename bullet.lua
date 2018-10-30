--! file: rectangle.lua
Bullet = Object:extend()
function Bullet.new(self, start, direction, charDimension)
    self.start = start
    self.direction = direction
    self.charDimension = charDimension
    self.speed = 700
    self.x = 0
    self.y = 0
    self.height = 0
    self.width = 0   
end

function Bullet.update(self, dt)
    --! logic 
    if self.direction == 'right' then
        self.x = self.start.x + self.charDimension.width
        self.y = self.start.y + 16
        self.height = 32
        self.width = 300
    elseif self.direction == 'left' then
        self.x = self.start.x - 300
        self.y = self.start.y + 16
        self.height = 32
        self.width = 300       
    elseif self.direction == 'up' then
        self.x = self.start.x + (self.charDimension.width / 2) - 16
        self.y = self.start.y - 300
        self.height = 300
        self.width = 32     
    elseif self.direction == 'down' then
        self.x = self.start.x + (self.charDimension.width / 2) - 16
        self.y = self.start.y + 40
        self.height = 300
        self.width = 32       
    end    
end

function Bullet.draw(self)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height )
end
