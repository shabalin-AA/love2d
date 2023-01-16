require "nodes"


Links = {}
function link (node1, node2)
  local n = {}
  n.value = adjacency_matrix[node1.num][node2.num]

  function n:draw ()
    draw_flag = true
    if self.value > 0 then love.graphics.setColor(0, 1, 0)
    elseif self.value < 0 then love.graphics.setColor(1, 0, 0)
    else draw_flag = false end

    love.graphics.setColor(0,0,0)

    if draw_flag then
      local dx = node2.x - node1.x
      local dy = node2.y - node1.y
      local l = math.sqrt(dx * dx + dy * dy)
      local sina = dy / l
      local cosa = dx / l
      local endpoint = {x = node2.x - R * cosa, y = node2.y - R * sina}

      love.graphics.line(node1.x, node1.y, endpoint.x, endpoint.y)

      local function digit (value)
        return value / math.abs(value)
      end

      local arrow_length = 10
      local arrow_width = 5
      local arrow_point = {
        x = endpoint.x - arrow_length * cosa,
        y = endpoint.y - arrow_length * sina
      }

      love.graphics.polygon(
        "fill",
        endpoint.x, endpoint.y,
        arrow_point.x + sina * sina * arrow_width,
        arrow_point.y + cosa * cosa * arrow_width,
        arrow_point.x - sina * sina * arrow_width,
        arrow_point.y - cosa * cosa * arrow_width
      )

      local border = digit(node1.num - node2.num) * arrow_width * 3
      love.graphics.print(self.value, (node1.x + node2.x) / 2 + border, (node1.y + node2.y) / 2)
    end
  end

  table.insert(Links, n)
end

function Links:load ()
  Nodes:load()
  for i=1, #Nodes do
    for j=1, #Nodes do
      link(Nodes[i], Nodes[j])
    end
  end
end

function Links:draw ()
  for i=1, #self do
    self[i]:draw()
  end
end
