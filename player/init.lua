local constants = require "constants"

local player = {}

local front = love.graphics.newImage("player/front.png")
local climb_a = love.graphics.newImage("player/climb_a.png")
local climb_b = love.graphics.newImage("player/climb_b.png")
local walk_a = love.graphics.newImage("player/walk_a.png")



function player:new()
    local newPlayer = {}
    setmetatable(newPlayer, self)
    self.__index = self
    newPlayer.x = 100
    newPlayer.y = 100
    newPlayer.speed = constants.PLAYER_SPEED
    -- newPlayer.width = constants.PLAYER_WIDTH
    -- newPlayer.height = constants.PLAYER_HEIGHT
    return newPlayer
end


function player:move(dt)
    self:movement("move", dt)
 
end


function player:draw()
    self:movement("draw")
    
    
end

function player:movement(type, dt)
    local moving = false
    if type == "draw" then
        if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
            moving = true
            love.graphics.draw(climb_a, self.x, self.y)
        end
        if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
            moving = true
            love.graphics.draw(front, self.x, self.y)
        end
        if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
            moving = true
            love.graphics.draw(walk_a, self.x, self.y)
        end
        if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
            moving = true
        end

        if not moving then
            -- No movement keys pressed, do nothing
            love.graphics.draw(front, self.x, self.y)
        end

    elseif type == "move" then
        if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
            moving = true
            self.y = self.y - self.speed * dt       
        end
        if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
            self.y = self.y + self.speed * dt
            moving = true
        end
        if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
            self.x = self.x - self.speed * dt
            moving = true
        end
        if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
            self.x = self.x + self.speed * dt
            moving = true
        end

        if not moving then
            -- No movement keys pressed, do nothing
        end
    end
end



return player