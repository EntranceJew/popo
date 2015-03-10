local Text = {}
Text.__index = Text
require(tostring(...):sub(1, -6) .. 'utf8-l')

function Text.new(x, y, text, settings)
    local self = {}
    self.x, self.y = x, y
    local settings = settings or {}
    for k, v in pairs(settings) do self[k] = v end
    self.raw_text = text:gsub('\n', '@n')
    self.config = settings
    if not self.font then self.font = love.graphics.getFont() end

    self.text = self.raw_text

    print(
        self.text:match('%[(.*)%]')
    )


    return setmetatable(self, Text)
end

function Text:update(dt)
    
end

function Text:draw()
    --[[
    for _, c in ipairs(self.characters) do
        love.graphics.print(c.character, self.x + c.x, self.y + c.y, 0, 1, 1)
    end
    ]]--
end

return setmetatable({new = new}, {__call = function(_, ...) return Text.new(...) end})
