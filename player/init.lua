local constants = require "constants"

local player = {}

-- local front = love.graphics.newImage("player/front.png")
-- local climb_a = love.graphics.newImage("player/climb_a.png")
-- local climb_b = love.graphics.newImage("player/climb_b.png")
-- local walk_a = love.graphics.newImage("player/walk_a.png")

local images = {}
local currentImageIndex = 1
local timer = 0
local interval = 0.2 -- Time interval for switching images (in seconds)


function player:load()
    images[1] = love.graphics.newImage("player/front.png")
    images[2] = love.graphics.newImage("player/climb_a.png")
    images[3] = love.graphics.newImage("player/climb_b.png")
    images[4] = love.graphics.newImage("player/walk_a.png")
end

-- Need to organize based on the direction the player is moving. If the player is moving up, then the climbing images should be used. If the player is moving down, then the front image should be used. If the player is moving left or right, then the walking images should be used. If the player is not moving, then the front image should be used.
function player:update(dt) 
    
    self:move(dt)
    timer = timer + dt
    if timer >= interval then
        timer = 0
        currentImageIndex = currentImageIndex + 1
        if currentImageIndex > #images then
            currentImageIndex = 1
        end
    end



end

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

    local up = love.keyboard.isDown("up") or love.keyboard.isDown("w")
    local down = love.keyboard.isDown("down") or love.keyboard.isDown("s")
    local left = love.keyboard.isDown("left") or love.keyboard.isDown("a")
    local right = love.keyboard.isDown("right") or love.keyboard.isDown("d")

    if type == "draw" then
        if up then
            love.graphics.draw(climb_a, self.x, self.y)
        -- elseif up and left then
        --     love.graphics.draw(climb_b, self.x, self.y)
        elseif down then
            love.graphics.draw(front, self.x, self.y)
        elseif left then
            love.graphics.draw(walk_a, self.x, self.y)
        elseif right then
            love.graphics.draw(walk_a, self.x, self.y)
        else
            love.graphics.draw(front, self.x, self.y)
        end

    elseif type == "move" then
        if up then
            self.y = self.y - self.speed * dt       
        elseif down then
            self.y = self.y + self.speed * dt
        elseif left then
            self.x = self.x - self.speed * dt
            moving = true
        elseif right then
            self.x = self.x + self.speed * dt
        end
    end
end



return player