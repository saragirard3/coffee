local constants = require "constants"

local coffee = {}

coffeeimage = love.graphics.newImage("coffee/key_yellow.png")

function coffee:new()
    local newCoffee = {}
    setmetatable(newCoffee, self)
    self.__index = self
    newCoffee.x = 500
    newCoffee.y = 500
    return newCoffee
end


coffee.draw = function(self)

    love.graphics.draw(coffeeimage, self.x, self.y)
end


return coffee