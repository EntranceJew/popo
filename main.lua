Text = require 'Text'

function love.load()
    text = Text(20, 50, 'dhsaudoasidja sd ohasod hasoi dhaf dfhds hfdso fh dsofds oifdsod ji llsodjss', {wrap_width = 100})
end

function love.update(dt)
    local x, y = love.mouse.getPosition()
    print(x, y)
    text:update(dt)
end

function love.draw()
    text:draw()
end
