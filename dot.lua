Dot = {}

function Dot:load()
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
    self.radius = 40
    self.radiusCollision = self.radius * 2 
    self.speed = 300
    self.color = {r = 255, g = 0, b = 0}
    self.collided = false
end

function Dot:update(dt)
    print(self.x)
    -- Player inputs and game boundaries.
    if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
        self.y = self.y - self.speed * dt
    elseif love.keyboard.isDown("s") or love.keyboard.isDown("down") then
        self.y = self.y + self.speed * dt
    end
    if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
        self.x = self.x + self.speed * dt
    elseif love.keyboard.isDown("a") or love.keyboard.isDown("left") then
        self.x = self.x - self.speed * dt
    end
    if self.x < self.radiusCollision / 2 then
        self.x = self.radiusCollision / 2
    elseif self.x + self.radiusCollision / 2 > love.graphics.getWidth()  then
        self.x = love.graphics.getWidth() - self.radiusCollision / 2
    end
    if self.y < self.radiusCollision / 2 then
        self.y = self.radiusCollision / 2
    elseif self.y + self.radiusCollision / 2 > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.radiusCollision / 2
    end

end

function Dot:draw()
    love.graphics.setColor(self.color.r, self.color.g, self.color.b)
    love.graphics.circle("fill", self.x, self.y, self.radius)
    -- love.graphics.setColor(255, 255, 255)
    -- love.graphics.circle("fill", self.x, self.y, 5)
end
