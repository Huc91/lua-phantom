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
    require "enemy"
    require "bullet"
    require "gui-battery"

    robot = Character(100, 100, 64, 96, 'robot')
    
    enemy = Enemy(100, 100, 64, 64, 'enemy', 200, 100)
    enemies = {
        Enemy(100, 100, 64, 64, 'enemy', 200, 100),
        Enemy(400, 100, 64, 64, 'enemy', 150, 200),
        Enemy(500, 10, 64, 64, 'enemy', 250, 90)
    }

    bullet = nil

    energy = 150
    maxEnergy = 150
    guiBattery = GUI_Battery(16, 16, energy, maxEnergy)

    gotcha = 0


end

--[[ Run continuosly --]]
function love.update(dt)
    robot:update(dt)

    for i=1,#enemies do
        enemies[i]:update(dt)
    end

    if bullet ~= nil then
        energy = energy - 1
        bullet:update(dt)

        for i=1,#enemies do
            if checkCollision(enemies[i], bullet) then
                print('gotcha')
                enemies[i]:isHit(true)
            end
        end
    else 
        if energy < (maxEnergy - 1) then
            energy = energy + 2
        end
    end
    guiBattery:update(dt)
end

--[[ This function is also called continuously --]]
function love.draw()
    love.graphics.setColor(1, 1, 1)
    robot:draw()

    for i=1,#enemies do
        enemies[i]:draw()
    end    

    if bullet ~= nil then
        love.graphics.setColor(1, 0, 0, 0.7)
        bullet:draw()
    end
    love.graphics.setColor(1, 1, 1)
    guiBattery:draw()
end

function love.keypressed(key)
    robot:keyPressed(key)
end

function love.keyreleased(key)
    robot:keyReleased(key)
end
