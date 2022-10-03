require "world"


sand = {}
function sand:load()
    self:add(0, 0)
end

function sand:add(x, y)
    local s = {}
    s.x = x
    s.y = y
    s.d = 2
    s.body = love.physics.newBody(
      world,
      s.x + s.d / 2,
      s.y + s.d / 2,
      "dynamic")
    s.shape = love.physics.newRectangleShape(s.d, s.d)
    --s.shape = love.physics.newCircleShape(s.d)
    s.fixture = love.physics.newFixture(s.body, s.shape, 100)
    s.fixture:setRestitution(0)
    table.insert(self,s)
end

function sand:update(dt)
    if love.mouse.isDown(1) then
        local x, y = love.mouse.getPosition()
        self:add(x,y)
    end
end

function sand:draw()
    for i=1,#self do
        love.graphics.setColor(194/256, 178/256, 128/256)
        love.graphics.rectangle("fill", self[i].body:getX() - self[i].d / 2, self[i].body:getY() - self[i].d / 2, self[i].d, self[i].d)
    end
end
