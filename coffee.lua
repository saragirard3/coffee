local constants = require "constants"

local coffee = {}

function coffee:new()
    local newCoffee = {}
    setmetatable(newCoffee, self)
    self.__index = self
    newCoffee.x = 500
    newCoffee.y = 500
    newCoffee.width = 10
    newCoffee.height = 10
    return newCoffee
end


coffee.draw = function(self)
    love.graphics.setColor(1, 1, 0) -- Set color to yellow
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end


return coffee