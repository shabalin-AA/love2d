require "Coords"
require "Functions"


Points = {}
function Points:draw ()
  --love.graphics.print(tostring(#Functions), 0, 0)
  for i=1,#Functions do
    local points = {}
    local left_border = -Coords.Center.x / Coords.Scale - 10
    local right_border = (love.graphics.getWidth() - Coords.Center.x) / Coords.Scale
    for x = left_border, right_border, Coords.eps / math.pow(Coords.Scale, 1/3) do
      local p = {}
      p.x = x
      p.y = Functions[i](x)
      table.insert(points,p)
    end

    love.graphics.setColor(Colors[i][1], Colors[i][2], Colors[i][3])
    for j=2,#points do
      love.graphics.line(Coords.Center.x + points[j-1].x * Coords.Scale,
                        Coords.Center.y - points[j-1].y * Coords.Scale,
                        Coords.Center.x + points[j].x * Coords.Scale,
                        Coords.Center.y - points[j].y * Coords.Scale)
    end
    love.graphics.print(tostring(#points), 0, 0)
  end
end
