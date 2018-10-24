--! file: rectangle.lua
Enemy = Object:extend()
function Enemy.new(self, x, y, w, h, name, speed)
	self.x = x
	self.y = y
    self.width = w
    self.height = h
    self.name = name
    self.direction = 'down'
    self.imageName = self.name .. "/" .. self.direction .. ".png"
    self.image = love.graphics.newImage(self.imageName)
    self.speed = speed
    self.count = 0
    self.random = 0
end

function Enemy.update(self, dt)
    --! simple random intelligence
    if self.count == 0 then
        self.random = math.random (3,4)
        self.count = self.count + 1
    elseif self.count < 40 then
        self.count = self.count + 1
    else 
        self.random = math.random (3,4)
        self.count = 1
    end

    --! logic
    if self.random == 1 then
        self.x = self.x + self.speed * dt
        self.direction = 'right'
        self.imageName = self.name .. "/" .. self.direction .. ".png"
        self.image = love.graphics.newImage(self.imageName)
    elseif self.random == 2 then
        self.x = self.x - self.speed * dt
        self.direction = 'left'
        self.imageName = self.name .. "/" .. self.direction .. ".png"
        self.image = love.graphics.newImage(self.imageName)
    elseif self.random == 3 then
        self.y = self.y - self.speed * dt
        self.direction = 'up'
        self.imageName = self.name .. "/" .. self.direction .. ".png"
        self.image = love.graphics.newImage(self.imageName)
    elseif self.random == 4 then
        self.y = self.y + self.speed * dt
        self.direction = 'down'
        self.imageName = self.name .. "/" .. self.direction .. ".png"
        self.image = love.graphics.newImage(self.imageName)
    end
end

function Enemy.draw(self)
  love.graphics.draw(self.image, self.x, self.y)
end
