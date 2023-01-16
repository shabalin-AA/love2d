require "Points"


function love.load ()
  love.graphics.setBackgroundColor(1, 1, 1)
end


function love.update (dt)
  local shift = 10
  if love.keyboard.isDown("up") then
    love.graphics.clear(1, 1, 1)
    Coords.Center.y = Coords.Center.y + shift

  elseif love.keyboard.isDown("down") and Coords.Scale > 5 then
    love.graphics.clear(1, 1, 1)
    Coords.Center.y = Coords.Center.y - shift

  elseif love.keyboard.isDown("right") then
    love.graphics.clear(1, 1, 1)
    Coords.Center.x = Coords.Center.x - shift

  elseif love.keyboard.isDown("left") then
    love.graphics.clear(1, 1, 1)
    Coords.Center.x = Coords.Center.x + shift

  elseif love.keyboard.isDown("-") and Coords.Scale > 1 then
    love.graphics.clear(1, 1, 1)
    Coords.Scale = Coords.Scale * 14 / 15

  elseif love.keyboard.isDown("=") then
    love.graphics.clear(1, 1, 1)
    Coords.Scale = Coords.Scale * 15 / 14

  elseif love.keyboard.isDown("c") then
    Coords.Center.x = love.graphics.getWidth() / 2
    Coords.Center.y = love.graphics.getHeight() / 2
  end
end


function love.draw ()
  Coords:draw()
  Points:draw()
  love.graphics.setColor(0,0,0)

  x,y = love.mouse.getPosition()
  love.graphics.setColor(0, 0, 0)
  local accuracy = 100
  local xpos = math.ceil(((x - Coords.Center.x) / Coords.Scale) * accuracy) / accuracy
  local ypos = math.ceil(((Coords.Center.y - y) / Coords.Scale) * accuracy) / accuracy
  love.graphics.print(tostring(xpos).."; "..tostring(ypos), x + 10, y + 10)
end


function love.keypressed (key, scancode)
  if key == "space" then
    addFunction("math.pow(x, 2)")
  end
end
