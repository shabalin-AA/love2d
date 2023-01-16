math.randomseed(os.clock())

Functions = {}
Colors = {}

Functions[1] = function (x)
  return 1 / x
end

--[[Functions[2] = function (x)
  return math.sqrt(x)
end]]

for i=1,#Functions do
  table.insert(Colors, {math.random(), math.random(), math.random()})
end
