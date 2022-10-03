require "world"


ground = {}
function ground:load()
    ground.width = love.graphics.getWidth()
    ground.height = 10
    ground.x = 0
    ground.y = love.graphics.getHeight() - ground.height
    ground.body = love.physics.newBody(world, ground.x + ground.width / 2, ground.y + ground.height / 2)
    ground.shape = love.physics.newRectangleShape(ground.width, ground.height)
    ground.fixture = love.physics.newFixture(ground.body, ground.shape)
end

function ground:draw()
    love.graphics.setColor(150/256, 150/256, 150/256)
    love.graphics.rectangle("line", ground.x, ground.y, ground.width, ground.height)
end


left = {}
function left:load()
    left.width = 10
    left.height = love.graphics.getHeight()
    left.x = 0
    left.y = 0
    left.body = love.physics.newBody(world, left.x + left.width / 2, left.y + left.height / 2)
    left.shape = love.physics.newRectangleShape(left.width, left.height)
    left.fixture = love.physics.newFixture(left.body, left.shape)
end

function left:draw()
    love.graphics.setColor(150/256, 150/256, 150/256)
    love.graphics.rectangle("line", left.x, left.y, left.width, left.height)
end


right = {}
function right:load()
    right.width = 10
    right.height = love.graphics.getHeight()
    right.x = love.graphics.getWidth() - right.width
    right.y = 0
    right.body = love.physics.newBody(world, right.x + right.width / 2, right.y + right.height / 2)
    right.shape = love.physics.newRectangleShape(right.width, right.height)
    right.fixture = love.physics.newFixture(right.body, right.shape)
end

function right:draw()
    love.graphics.setColor(150/256, 150/256, 150/256)
    love.graphics.rectangle("line", right.x, right.y, right.width, right.height)
end


up = {}
function up:load()
    up.width = love.graphics.getWidth()
    up.height = 10
    up.x = 0
    up.y = 0
    up.body = love.physics.newBody(world, up.x + up.width / 2, up.y + up.height / 2)
    up.shape = love.physics.newRectangleShape(up.width, up.height)
    up.fixture = love.physics.newFixture(up.body, up.shape)
end

function up:draw()
    love.graphics.setColor(150/256, 150/256, 150/256)
    love.graphics.rectangle("line", up.x, up.y, up.width, up.height)
end


platform = {}
function platform:load()
    platform.width = 100
    platform.height = 10
    platform.x = 100
    platform.y = 100
    platform.body = love.physics.newBody(
      world,
      platform.x + platform.width / 2,
      platform.y + platform.height / 2,
      "static")
    platform.shape = love.physics.newRectangleShape(platform.width, platform.height)
    platform.fixture = love.physics.newFixture(platform.body, platform.shape)
end

function platform:draw()
    love.graphics.setColor(150/256, 150/256, 150/256)
    love.graphics.rectangle("line", self.body:getX() - self.width / 2, self.body:getY() - self.height / 2, self.width, self.height)
end


borders = {}
table.insert(borders,ground)
table.insert(borders,left)
table.insert(borders,right)
table.insert(borders,up)
table.insert(borders,platform)
