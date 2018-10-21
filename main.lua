--[[ Run Once time at the start of the game --]]
function love.load()
    imgX = 200
    imgY = 200
    love.graphics.setNewFont(16)
    love.graphics.setColor(220,220,220)
    love.graphics.setBackgroundColor(0,0,0)
    Object = require "classic"
    require "character"
    robot = Character(100, 100, 200, 50, 'robot')
end

--[[ Run continuosly --]]
function love.update(dt)
    robot:update(dt)
end

--[[ This function is also called continuously --]]
function love.draw()
    robot:draw()
end
