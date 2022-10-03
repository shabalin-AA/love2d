require "borders"
require "ball"
require "control"
require "sand"


function love.load()
  love.graphics.setBackgroundColor(10/256, 20/256, 30/256)
  for k,v in pairs(borders) do
      v:load()
  end
  ball:load()
  sand:load()
end

function love.update(dt)
  world:update(dt)
  ball:update(dt)
  sand:update(dt)
end

function love.draw()
    for k,v in pairs(borders) do
        v:draw()
    end
    ball:draw()
    sand:draw()
end
