local constants = require "constants"

local player = {}

local images = {}
local currentImageIndex = 1
local timer = 0
local interval = 0.3

function player:new()
    local newPlayer = {}
    setmetatable(newPlayer, self)
    self.__index = self
    newPlayer.x = 100
    newPlayer.y = 100
    newPlayer.speed = constants.PLAYER_SPEED
    return newPlayer
end

function player:load()
    images[1] = love.graphics.newImage("player/front.png")
    images[2] = love.graphics.newImage("player/climb_a.png")
    images[3] = love.graphics.newImage("player/climb_b.png")
    images[4] = love.graphics.newImage("player/walk_a.png")
end

function player:update(dt)
    self:move(dt)

    local up = love.keyboard.isDown("up") or love.keyboard.isDown("w")
    local down = love.keyboard.isDown("down") or love.keyboard.isDown("s")
    local left = love.keyboard.isDown("left") or love.keyboard.isDown("a")
    local right = love.keyboard.isDown("right") or love.keyboard.isDown("d")

    if up then
        self:animate(2, 3, dt)
    elseif down or left or right then
        self:animate(4, 1, dt)
    else
        currentImageIndex = 1
    end
end

function player:draw()
    love.graphics.draw(images[currentImageIndex], self.x, self.y)
end

function player:move(dt)
    local up = love.keyboard.isDown("up") or love.keyboard.isDown("w")
    local down = love.keyboard.isDown("down") or love.keyboard.isDown("s")
    local left = love.keyboard.isDown("left") or love.keyboard.isDown("a")
    local right = love.keyboard.isDown("right") or love.keyboard.isDown("d")

    if up then
        self.y = self.y - self.speed * dt
    elseif down then
        self.y = self.y + self.speed * dt
    elseif left then
        self.x = self.x - self.speed * dt
    elseif right then
        self.x = self.x + self.speed * dt
    end
end

function player:animate(index1, index2, dt)
    timer = timer + dt
    if timer >= interval then
        timer = timer - interval
        if currentImageIndex == index1 then
            currentImageIndex = index2
        else
            currentImageIndex = index1
        end
    end
end

return player
