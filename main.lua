--[[ Run Once time at the start of the game --]]
function love.load()
    imgX = 200
    imgY = 200
    love.graphics.setNewFont(16)
    love.graphics.setColor(220,220,220)
    love.graphics.setBackgroundColor(0,0,0)
    Object = require "classic"
    require "collision"
    require "character"
    robot = Character(100, 100, 64, 96, 'robot')
    require "enemy"
    enemy = Enemy(100, 100, 64, 64, 'enemy', 200, 100)
    require "bullet"
    bullet = nil
    energy = 150
    maxEnergy = 150
    gotcha = 0
end

--[[ Run continuosly --]]
function love.update(dt)
    robot:update(dt)
    enemy:update(dt)
    if bullet ~= nil then
        energy = energy - 1
        bullet:update(dt)
        if checkCollision(enemy, bullet) then
            print('gotcha')
            enemy:isHit(true)
        end
    else 
        if energy < (maxEnergy - 1) then
            energy = energy + 2
        end
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
    love.graphics.setColor(1, 1, 1)
    love.graphics.print( energy, 16, 16)
end

function love.keypressed(key)
    robot:keyPressed(key)
end

function love.keyreleased(key)
    robot:keyReleased(key)
end
