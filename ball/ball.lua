require "world"


ball = {}
function ball:load()
    ball.x = 50
    ball.y = 50
    ball.d = 10
    ball.body = love.physics.newBody(
      world,
      ball.x + ball.d / 2,
      ball.y + ball.d / 2,
      "dynamic")
    ball.shape = love.physics.newCircleShape(ball.d)
    ball.fixture = love.physics.newFixture(ball.body, ball.shape, 10)
    ball.fixture:setRestitution(0.7)
end

function ball:update(dt)
    ball.x = ball.body:getX()
    ball.y = ball.body:getY()

    local force = 500
    if love.keyboard.isDown("d") then
        ball.body:applyForce(force / 2, 0)
    elseif love.keyboard.isDown("a") then
        ball.body:applyForce(-force / 2, 0)
    end
end

function ball:draw()
    love.graphics.setColor(255/256, 20/256, 150/256)
    love.graphics.circle("fill", ball.x, ball.y, ball.d)
end

function love.keypressed( key, scancode, isrepeat )
    if key == "space" then
        ball.body:applyForce(0, -5*10^3)
    end
end
