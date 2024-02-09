Point = {}

function Point:load()
    self.point = 0
    love.graphics.setNewFont(90)
end

function Point:update(dt)
end

function Point:draw()
    love.graphics.setColor(255,255,255)
    love.graphics.printf(self.point, 0, 0, 250, "left")
end