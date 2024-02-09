Coin = {}

function Coin:load()
    self.radius = 20
    self.radiusCollision = self.radius * 2
    self.color = {r = 255, g = 255, b = 0}
    self.collided = false
    self.spawnFrequency = 2
    self:spawn()
end

function Coin:update(dt)
    -- print(self.collided)
    self:collide(Dot)
    if self.collided == false then
        local timeElapsed = love.timer.getTime() - self.spawnTime
        if timeElapsed > self.spawnFrequency then
            self:spawn()
        end
    end
end

function Coin:draw()
    if not self.collided then
        love.graphics.setColor(self.color.r, self.color.g, self.color.b)
        love.graphics.circle("fill", self.x, self.y, self.radius)
    end
end

function Coin:spawn()
    -- Randomizing coins spawn coordinates.
    -- Dealing with coin spawning inside of the Dot.
    self.x = math.random(self.radiusCollision, love.graphics.getWidth())
    if self.x == Dot.x then
        self.x = math.random(self.radiusCollision, love.graphics.getWidth()) + Dot.radiusCollision
    end
    self.y = math.random(self.radiusCollision, love.graphics.getHeight())
    if self.y == Dot.y then
        self.y = math.random(self.radiusCollision, love.graphics.getHeight()) + Dot.radiusCollision
    end
    self.spawnTime = love.timer.getTime()
    self.collided = false
end

-- Collision
function Coin:collide(dot)
    distance = math.sqrt((self.x - dot.x) ^ 2 + (self.y - dot.y) ^ 2)
    if distance < self.radius + Dot.radius then
        Point.point = Point.point + 1
        self:spawn()
    end
end