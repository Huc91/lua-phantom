--[[ Run Once time at the start of the game --]]
function love.load()
    image = love.graphics.newImage("ghost.png")
    imgX = 200
    imgY = 200
    love.graphics.setNewFont(16)
    love.graphics.setColor(220,220,220)
    love.graphics.setBackgroundColor(0,0,0)
end

--[[ Run continuosly --]]
function love.update(dt)
    if love.keyboard.isDown("right") then
        imgX = imgX + 150 * dt -- this would increment num by 100 per second explanation http://sheepolution.com/learn/book/5
    elseif love.keyboard.isDown("left") then
        imgX = imgX - 150 * dt
    else
        imgX = imgX
    end
end

--[[ This function is also called continuously --]]
function love.draw()
    love.graphics.print("num", 20, 20)
    love.graphics.print("A spooky ghost", 20, 40)
    love.graphics.draw(image, imgX, imgY)
end

function love.mousepressed(x, y, button, istouch)
    if button == 1 then 
        imgX = x
        imgY = y
    end
end