--[[ Run Once time at the start of the game --]]
function love.load()
    imgX = 200
    imgY = 200
    love.graphics.setNewFont(16)
    love.graphics.setColor(220,220,220)
    love.graphics.setBackgroundColor(0,0,0)
    Object = require "classic"
    require "character"
    robot = Character(100, 100, 64, 96, 'robot')
    require "enemy"
    enemy = Enemy(100, 100, 200, 50, 'enemy', 200)
    require "bullet"
    bullet = nil
end

--[[ Run continuosly --]]
function love.update(dt)
    robot:update(dt)
    enemy:update(dt)
    if bullet ~= nil then
        bullet:update(dt)
    end
end

--[[ This function is also called continuously --]]
function love.draw()
    love.graphics.setColor(1, 1, 1)
    robot:draw()
    enemy:draw()
    if bullet ~= nil then
        love.graphics.setColor(1, 0, 0, 0.7)
        bullet:draw()
    end    
end

function love.keypressed(key)
    robot:keyPressed(key)
end

function love.keyreleased(key)
    robot:keyReleased(key)
end
