local constants = require "constants"

local player = {}


function player:new()
    local newPlayer = {}
    setmetatable(newPlayer, self)
    self.__index = self
    newPlayer.x = 100
    newPlayer.y = 100
    newPlayer.speed = constants.PLAYER_SPEED
    newPlayer.width = 50
    newPlayer.height = 50
    return newPlayer
end


function player:move(dt)
    if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
        self.y = self.y - self.speed * dt
    end
    if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
        self.y = self.y + self.speed * dt
    end
    if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
        self.x = self.x - self.speed * dt
    end
    if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
        self.x = self.x + self.speed * dt
    end
end


function player:draw()
    love.graphics.setColor(1, 0, 0) -- Set color to red
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end


return player