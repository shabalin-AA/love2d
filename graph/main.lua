require "links"

function love.load ()
  love.graphics.setBackgroundColor(1, 1, 1)
  Links:load()
end

function love.update (dt)
  Nodes:update(dt)
end

function love.draw ()
  love.graphics.setColor(0, 0, 0)
  --[[local cx, cy = love.graphics.getWidth() / 2, love.graphics.getHeight() / 2
  love.graphics.circle("line", cx, cy, 150)
  love.graphics.circle("line", cx, cy, 300)
  love.graphics.circle("line", cx, cy, 550)
  love.graphics.circle("line", cx, cy, 700)]]

  Links:draw()
  Nodes:draw()
end


function love.mousepressed(x, y, button, istouch)
  for i=1, #Nodes do
    if x > Nodes[i].x - R and x < Nodes[i].x + R then
      if y > Nodes[i].y - R and y < Nodes[i].y + R then
        Nodes[i].drag = not Nodes[i].drag
      end
    end
  end
end
