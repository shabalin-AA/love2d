Coords = {}
Coords.Scale = 50
Coords.eps = 1 / 30
Coords.Center = {
  x = love.graphics.getWidth() / 2,
  y = love.graphics.getHeight() / 2
}


function Coords:draw ()
  -- single segments grid
  love.graphics.setColor(0.7, 0.7, 0.7)
  love.graphics.setLineWidth(1)

  -- vertical
  for x = self.Center.x, love.graphics.getWidth(), self.Scale do
    love.graphics.line(x, 0, x, love.graphics.getHeight())
  end

  for x = self.Center.x, 0, -self.Scale do
    love.graphics.line(x, 0, x, love.graphics.getHeight())
  end

  -- horizontal
  for y = self.Center.y, love.graphics.getHeight(), self.Scale do
    love.graphics.line(0, y, love.graphics.getWidth(), y)
  end

  for y = self.Center.y, 0, -self.Scale do
    love.graphics.line(0, y, love.graphics.getWidth(), y)
  end


  love.graphics.setColor(0, 0, 0)
  love.graphics.setLineWidth(2)
  -- X axis
  love.graphics.line(0, self.Center.y,
                    love.graphics.getWidth(), self.Center.y)
  -- Y axis
  love.graphics.line(self.Center.x, 0,
                    self.Center.x, love.graphics.getHeight())
end
