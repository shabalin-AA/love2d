local meter = 100
love.physics.setMeter(meter)
world = love.physics.newWorld(0, 9.81*meter, true)
