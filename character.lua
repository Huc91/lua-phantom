--! file: rectangle.lua
Character = Object:extend()
function Character.new(self, x, y, w, h, name)
	self.x = x
	self.y = y
	self.width = w
  self.height = h
  self.name = name
  self.direction = 'down'
  self.imageName = self.name .. "_" .. self.direction .. ".png"
  self.image = love.graphics.newImage(self.imageName)
	self.speed = 200
end

function Character.update(self, dt)
    if love.keyboard.isDown("right") then
      self.x = self.x + self.speed * dt
      self.direction = 'right'
      self.imageName = self.name .. "_" .. self.direction .. ".png"
      self.image = love.graphics.newImage(self.imageName)
  elseif love.keyboard.isDown("left") then
      self.x = self.x - self.speed * dt
      self.direction = 'left'
      self.imageName = self.name .. "_" .. self.direction .. ".png"
      self.image = love.graphics.newImage(self.imageName)
  elseif love.keyboard.isDown("up") then
      self.y = self.y - self.speed * dt
      self.direction = 'up'
      self.imageName = self.name .. "_" .. self.direction .. ".png"
      self.image = love.graphics.newImage(self.imageName)
  elseif love.keyboard.isDown("down") then
      self.y = self.y + self.speed * dt
      self.direction = 'down'
      self.imageName = self.name .. "_" .. self.direction .. ".png"
      self.image = love.graphics.newImage(self.imageName)
  end
end

function Character.draw(self)
  love.graphics.draw(self.image, self.x, self.y)
end

function Character:keyPressed(key)
    --If the spacebar is pressed
    if key == "space" then
        --new instance of Bullet
        start = {}
        start.x = self.x
        start.y = self.y
        direction = self.direction
        bullet = Bullet(start, direction)
    end
end
