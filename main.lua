Text = require 'Text'

function love.load()
    text = Text(20, 50, 'dhs dhasdiaso doaishf h dshois hofidhsofish dfs audoasidja sd ohasod hasoi dhaf dfhds hfdso fh dsofds oifdsod ji llsodjss', {wrap_width = 250})
end

function love.update(dt)
    local x, y = love.mouse.getPosition()
    --print(x, y)
    text:update(dt)
end

function love.draw()
    text:draw()
end
