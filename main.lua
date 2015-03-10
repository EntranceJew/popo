Text = require 'TextN'

function love.load()
    text = Text(20, 50, '[uudhs] oudda shoudha sd ohasod hasoi dhaf dfhds hfdso fh dsofds oifdsod ji llsodjss', {wrap_width = 100})
end

function love.update(dt)
    local x, y = love.mouse.getPosition()
    text:update(dt)
end

function love.draw()
    text:draw()
end
