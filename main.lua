require("dot")
require("coin")
require("point")

bgColor = {r = 47/255, g = 214/255, b = 200/255} -- Turquoise

function love.load()
    Dot:load()
    Point:load()
    Coin:load()
end

function love.update(dt)
    Dot:update(dt)
    Coin:update(dt)
    Point:update(dt)
    -- print(love.timer.getTime())
end

function love.draw()
    love.graphics.setBackgroundColor(bgColor.r, bgColor.g, bgColor.b)
    Dot:draw()
    Coin:draw()
    Point:draw()
end
