require "lab4"

R = 20
Nodes = {}
function node (num, x, y)
  local n = {}
  n.num = num
  if x then n.x = x else n.x = 50 end
  if y then n.y = y else n.y = 50 end

  n.drag = false

  function n:draw ()
    if not drag then
      love.graphics.setColor(0.5, 0.5, 1)
    else
      love.graphics.setColor(1, 0.5, 0.5)
    end
    love.graphics.circle("fill", self.x, self.y, R)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print(tostring(self.num), self.x - R / 2, self.y - R / 2)
  end

  function n:update (dt)
    if self.drag then
      self.x, self.y = love.mouse.getPosition()
    end
  end

  table.insert(Nodes, n)
end


function Nodes:load ()
  for i=1, #adjacency_matrix do
    node(i, i * R * 2, i * R * 2)
  end
end


function Nodes:update (dt)
  for i=1, #self do self[i]:update(dt) end
end


function Nodes:draw ()
  for i=1, #self do self[i]:draw() end
end
