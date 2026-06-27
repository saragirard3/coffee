local constants = require "constants"

local enemy = {}


function enemy:new()
    local newEnemy = {}
    setmetatable(newEnemy, self)
    self.__index = self
    newEnemy.x = 500
    newEnemy.y = 200
    newEnemy.speed = constants.ENEMY_SPEED
    newEnemy.width = 50
    newEnemy.height = 50
    return newEnemy
end


function enemy:move(dt)
    
end


function enemy:draw()
    love.graphics.setColor(1, 0, 0) -- Set color to red
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end


return enemy